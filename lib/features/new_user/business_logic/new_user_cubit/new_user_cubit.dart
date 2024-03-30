import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/features/new_user/data/models/save_new_user_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit() : super(NewUserInitial());
  FirebaseFirestore firestore = getIt<FirebaseFirestore>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final List<String> genderItems = [
    'male'.tr(),
    'female'.tr(),
  ];
  String? genderSelectedValue;
  DateTime? birthDate;

  Future updateNewUserData() async {
    emit(UpdateNewUserDataLoading());
    try {
      await getIt<FirebaseAuth>()
          .currentUser!
          .updateDisplayName(fullNameController.text);

      await firestore
          .collection('users')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .update(
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
      emit(UpdateNewUserDataFailed(errorMsg: error.toString()));
    }
  }
}
