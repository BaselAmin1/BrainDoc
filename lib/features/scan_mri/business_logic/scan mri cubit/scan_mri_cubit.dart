import 'dart:async';
import 'dart:io';

import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

part 'scan_mri_state.dart';

class ScanMriCubit extends Cubit<ScanMriState> {
  ScanMriCubit() : super(ScanMriInitial());
  bool showLoading = false;

  File? pickedImage;
  // File? image ;
  pickImage(ImageSource source, context) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      // this.image = imageTemp;
      pickedImage = imageTemp;
      showLoading = true;
      Timer(const Duration(seconds: 3), () {
        showLoading = false;
        emit(FinishLoading());
      });
      emit(PickImageSuccessState());
    } catch (e) {
      print("failed to pick image : $e");
      emit(PickImageErrorState(e.toString()));
    }
  }

  uploadImage({required image, context}) async {
    emit(UploadImageLoading());
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path, filename: fileName),
      });

      // Response? response =
      //     await Dio.post(endPoint: EndPoints.saveImage, data: formData);

      emit(UploadImageSuccess());
    } catch (e) {
      print("Error while uploading image: $e");

      emit(UploadImageError());
    }
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

                    pickImage(
                      ImageSource.gallery,
                      context,
                    );
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

                    pickImage(
                      ImageSource.camera,
                      context,
                    );
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
