import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIntroTextWidget extends StatelessWidget {
  VerifyIntroTextWidget({
    super.key,
    required this.phoneNumber,
  });
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('verifyYourPhoneNumber'.tr(), style: TextStyles.textStyle24),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: RichText(
            text: TextSpan(
              text: 'enterCode'.tr(),
              style: TextStyles.textStyle22,
              children: <TextSpan>[
                TextSpan(
                  text: phoneNumber,
                  style: TextStyles.textStyle22.copyWith(
                    color: AppColors.activeTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
