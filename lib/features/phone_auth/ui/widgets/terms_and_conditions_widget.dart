import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'byLogging'.tr(),
            style: TextStyles.textStyle14,
          ),
          TextSpan(
            text: 'terms&conditions'.tr(),
            style: TextStyles.textStyle14
                .copyWith(color: AppColors.activeTextColor),
          ),
          TextSpan(
            text: 'and'.tr(),
            style: TextStyles.textStyle14.copyWith(height: 1.5),
          ),
          TextSpan(
            text: 'privacyPolicy'.tr(),
            style: TextStyles.textStyle14
                .copyWith(color: AppColors.activeTextColor),
          ),
        ],
      ),
    );
  }
}
