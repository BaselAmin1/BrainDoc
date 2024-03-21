import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'getStarted'.tr(),
      onPressed: () {
        context.pushReplacementNamed(Routes.loginScreen);
      },
    );
  }
}
