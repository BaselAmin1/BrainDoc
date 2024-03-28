import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingTopTextsWidget extends StatelessWidget {
  const BookingTopTextsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'selectYourVisitDataAndTime'.tr(),
          style: TextStyles.textStyle22,
        ),
        SizedBox(height: 8.h),
        Text(
          'youCanChooseDataAAndTimeFromAvailableDoctorsSchedule'.tr(),
          style: TextStyles.textStyle20,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
