import 'package:BrainDoc/core/functions/easy_loading.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/auth_button_widget.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/login_intro_text_widget.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/phone_form_field_widget.dart';
import 'package:BrainDoc/features/phone_auth/ui/widgets/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> phoneFormKey = GlobalKey();

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

        if (state is PhoneNumberSubmitted) {
          hideLoading();
          Navigator.of(context).pushNamed(Routes.otpScreen,
              arguments: context.read<PhoneAuthCubit>().phoneNumber);
        }

        if (state is ErrorOccurred) {
          hideLoading();
          String errorMsg = (state).errorMsg;
          showError(errorMsg);
        }
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: Form(
              key: phoneFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginIntroTextWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    PhoneFormField(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AuthButton(
                    phoneFormKey: phoneFormKey,
                  ),
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
