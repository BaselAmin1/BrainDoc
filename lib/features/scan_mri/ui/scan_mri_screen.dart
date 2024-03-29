import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ScanMRIScreen extends StatelessWidget {
  const ScanMRIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'scanMRI'.tr(),
          style: TextStyles.textStyle22,
        ),
      ),
      body: Center(
        child: Text(
          'comingSoon'.tr(),
          style: TextStyles.textStyle24,
        ),
      ),
    );
  }
}
