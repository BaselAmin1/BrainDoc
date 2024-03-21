import 'package:BrainDoc/features/onboarding/ui/widgets/app_logo_and_name_widget.dart';
import 'package:BrainDoc/features/onboarding/ui/widgets/doc_image_and_text_widget.dart';
import 'package:BrainDoc/features/onboarding/ui/widgets/get_started_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Column(
            children: [
              const AppLogoAndName(),
              SizedBox(height: 24.h),
              const DoctorImageAndText(),
              const Spacer(),
              const GetStartedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
