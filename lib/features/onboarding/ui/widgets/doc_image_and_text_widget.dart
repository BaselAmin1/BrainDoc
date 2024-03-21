import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(Assets.assetsImagesAppLogoLowOpacity),
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.14, 0.4],
                ),
              ),
              child: Image.asset(Assets.assetsImagesOnboardingDoctor),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Text('bestDoctors'.tr(),
                  textAlign: TextAlign.center, style: TextStyles.textStyle28),
            ),
          ],
        ),
        SizedBox(
          height: 0.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'manageYourAppointment'.tr(),
            style: TextStyles.textStyle14.copyWith(height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
