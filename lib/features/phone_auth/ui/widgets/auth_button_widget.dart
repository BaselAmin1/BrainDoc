import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.phoneFormKey,
  });

  final GlobalKey<FormState> phoneFormKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'continue'.tr(),
      onPressed: () {
        if (!phoneFormKey.currentState!.validate()) {
       
          return;
        } else {
          phoneFormKey.currentState!.save();
          context.read<PhoneAuthCubit>().submitPhoneNumber();
        }
      },
    );
  }
}
