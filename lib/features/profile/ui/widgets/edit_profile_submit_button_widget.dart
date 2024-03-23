import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:BrainDoc/features/profile/data/models/update_user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileSubmitButtonWidget extends StatelessWidget {
   EditProfileSubmitButtonWidget(
      {super.key, required this.editProfileFormKey,
      required this.user});
  final GlobalKey<FormState> editProfileFormKey;
  DocumentSnapshot user;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      text: 'submit'.tr(),
      onPressed: () {
        if (!editProfileFormKey.currentState!.validate()) {
          return;
        } else {
          editProfileFormKey.currentState!.save();
          context.read<ProfileCubit>().updateUserProfile(UpdateUserDataModel(
                fullName: context.read<ProfileCubit>().fullNameController.text,
                email: context.read<ProfileCubit>().emailController.text,
                birthDate: context.read<ProfileCubit>().birthDate ??
                    DateTime.parse(
                       user!['birthDate']),
                gender: context.read<ProfileCubit>().genderSelectedValue ??
                  user!['gender'],
              ).toJson());
        }
      },
    );
  }
}
