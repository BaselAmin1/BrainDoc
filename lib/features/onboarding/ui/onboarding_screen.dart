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
      bottomNavigationBar: Container(
          margin:
              EdgeInsets.only(top: 0.h, bottom: 32.h, left: 16.2, right: 16.w),
          child: const GetStartedButton()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Column(
            children: [
              const AppLogoAndName(),
              SizedBox(height: 24.h),
              const DoctorImageAndText(),
            ],
          ),
        ),
      ),
    );
  }
}
