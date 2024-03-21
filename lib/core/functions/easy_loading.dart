import 'package:BrainDoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading({
  EasyLoadingMaskType maskType = EasyLoadingMaskType.clear,
}) {
  EasyLoading.show(maskType: maskType);
}

void hideLoading() {
  EasyLoading.dismiss();
}

void showError(String message) {
  EasyLoading.dismiss();
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom //This was missing in earlier code
    ..backgroundColor = AppColors.errorColor
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..maskColor = Colors.white
    ..dismissOnTap = false
    ..userInteractions = false;
  EasyLoading.showError(
    message,
  );
}

void showSuccess(String message) {
  EasyLoading.dismiss();

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom //This was missing in earlier code
    ..backgroundColor = AppColors.successColor
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..maskColor = Colors.white
    ..dismissOnTap = false
    ..userInteractions = false;
  EasyLoading.showSuccess(message);
}

void showInfo(String message) {
  EasyLoading.dismiss();

  EasyLoading.showInfo(
    message,
    dismissOnTap: true,
  );
}
