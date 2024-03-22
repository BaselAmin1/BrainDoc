import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewUserSubmitButtonWidget extends StatelessWidget {
  const NewUserSubmitButtonWidget({super.key, required this.newUserFormKey});
  final GlobalKey<FormState> newUserFormKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      text: 'submit'.tr(),
      onPressed: () {
        if (!newUserFormKey.currentState!.validate()) {
          return;
        } else {
          newUserFormKey.currentState!.save();
          context.read<NewUserCubit>().updateNewUserData();
        }
      },
    );
  }
}
