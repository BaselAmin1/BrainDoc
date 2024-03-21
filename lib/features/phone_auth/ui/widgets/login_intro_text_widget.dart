import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginIntroTextWidget extends StatelessWidget {
  const LoginIntroTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('whatIsYourPhoneNumber'.tr(), style: TextStyles.textStyle24),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child:
              Text('pleaseEnterYourPhone'.tr(), style: TextStyles.textStyle18),
        ),
      ],
    );
  }
}
