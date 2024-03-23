import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/cache_helper/cache_values.dart';
import 'package:BrainDoc/features/new_user/data/models/save_new_user_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit() : super(NewUserInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var uid = CacheHelper.getData(key: CacheKeys.uid);
  final List<String> genderItems = [
    'male'.tr(),
    'female'.tr(),
  ];
  String? genderSelectedValue;
  DateTime? birthDate;

  Future updateNewUserData() async {
    try {
      await firestore.collection('users').doc(uid).update(
            SaveNewUserDataModel(
              fullName: fullNameController.text,
              email: emailController.text,
              gender: genderSelectedValue!,
              image: '',
              birthDate: birthDate!,
            ).toJson(),
          );
      emit(UpdateNewUserDataSuccess());
    } catch (error) {
      print(error.toString());
      emit(UpdateNewUserDataFailed(errorMsg: error.toString()));
    }
  }
}
