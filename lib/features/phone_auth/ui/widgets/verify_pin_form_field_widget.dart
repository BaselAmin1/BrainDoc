import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPinFormFieldWidget extends StatelessWidget {
  const VerifyPinFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: false,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          inactiveFillColor: Colors.white,
          activeFillColor: Colors.white,
          selectedColor: AppColors.primaryColor,
          selectedFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          context.read<PhoneAuthCubit>().otpCode = submitedCode;

          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
