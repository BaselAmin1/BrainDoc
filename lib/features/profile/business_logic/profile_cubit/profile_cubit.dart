import 'dart:io';

import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/cache_helper/cache_values.dart';
import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref();
  var uid = CacheHelper.getData(key: CacheKeys.uid);
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final List<String> genderItems = [
    'male'.tr(),
    'female'.tr(),
  ];
  String? genderSelectedValue;
  DateTime? birthDate;
  String? _imageUrl;

  DateTime formatDate(user) {
    String dateString = user!['birthDate'];
    List<String> dateParts = dateString.split('-');

    if (dateParts.length == 3) {
      int year = int.tryParse(dateParts[0]) ?? 0;
      int month = int.tryParse(dateParts[1]) ?? 0;
      int day = int.tryParse(dateParts[2]) ?? 0;

      birthDate = DateTime(year, month, day);
    }
    return birthDate!;
  }

  Future getUserProfileData() async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection('users').doc(uid).get();

      if (snapshot.exists) {
        emit(ProfileLoaded(
          snapshot,
        ));
      } else {
        throw Exception('User profile not found');
      }
    } catch (e) {
      print('Error fetching user profile data: $e');
      emit(ProfileError(e.toString()));
    }
  }

  Future updateUserProfile(Map<String, dynamic> newData) async {
    try {
      emit(UpdateUserLoadingState());

      print(uid);
      await firestore
          .collection('users')
          .doc(uid)
          .update(newData); // Use update method instead of set with merge

      emit(UpdateUserSuccessState());
    } catch (e) {
      print('Error updating user profile: $e');
      emit(UpdateUserErrorState(e.toString()));
    }
  }

  void uploadImage() async {
    try {
      if (pickedImage == null) {
        emit(const UploadImageErrorState('No image selected'));
        return;
      }

      Uint8List imageData = await pickedImage!.readAsBytes();

      String imagePath =
          'images/${DateTime.now().millisecondsSinceEpoch}.jpg'; // Example path

      UploadTask storageUploadTask = ref.child(imagePath).putData(imageData);

      TaskSnapshot snapshot = await storageUploadTask;

      if (snapshot.state == TaskState.success) {
        _imageUrl = await snapshot.ref.getDownloadURL();
        print('Image uploaded url: $_imageUrl');
        updateUserProfile({
          'image': _imageUrl,
        });
        emit(UploadImageSuccessState());
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      print('Error uploading image: $e');
      emit(UploadImageErrorState(e.toString()));
    }
  }

  final ImagePicker picker = ImagePicker();
  File? pickedImage;

  Future<void> pickImageFromDevice() async {
    try {
      PickedFile? pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );

      pickedImage = File(pickedFile!.path);
      cropImage(imageFile: pickedImage!);
    } catch (e) {
      emit(PickImageErrorState(e.toString()));
    }
  }

  Future<void> takeImageFromCamera() async {
    try {
      PickedFile? pickedFile = await picker.getImage(
        source: ImageSource.camera,
      );

      pickedImage = File(pickedFile!.path);
      cropImage(imageFile: pickedImage!);
    } catch (e) {
      emit(PickImageErrorState(e.toString()));
    }
  }

  CroppedFile? croppedFile;
  Future<File?> cropImage({required File imageFile}) async {
    croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    pickedImage = File(croppedFile!.path);
    emit(PickImageSuccessState());
    return null;
  }

  imageDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 0.5.h,
          ),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
            width: 70.w,
            height: 190.h,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Select Image Source :',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.pop();

                    pickImageFromDevice();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 1, 2, 6),
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/gallery_image.png',
                          width: 20.w,
                        ),
                        SizedBox(width: 5.w),
                        const Text(
                          'Pick Image From Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.pop();

                    takeImageFromCamera();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        156,
                        179,
                        254,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.sp,
                      ),
                    ),
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/camera_image.png',
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text(
                          'Take Image From Camera',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
