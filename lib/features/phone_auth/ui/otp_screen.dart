import 'package:BrainDoc/core/functions/easy_loading.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/terms_and_conditions_widget.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/verify_button_widget.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/verify_intro_text_widget.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/verify_pin_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          showLoading();
        }

        if (state is PhoneOTPVerified) {
          hideLoading();
          Navigator.of(context).pushReplacementNamed(Routes.mainLayout);
        }
        if (state is LoginNewUser) {
          hideLoading();
          Navigator.of(context).pushReplacementNamed(Routes.newUserScreen);
        }

        if (state is ErrorOccurred) {
          String errorMsg = (state).errorMsg;
          showError(errorMsg);
        }
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
              child: Column(
                children: [
                  VerifyIntroTextWidget(
                    phoneNumber: phoneNumber,
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  const VerifyPinFormFieldWidget(),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerifyButton(),
                  SizedBox(
                    height: 16.h,
                  ),
                  const TermsAndConditionsText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
