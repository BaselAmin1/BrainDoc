import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDoctorWidget extends StatelessWidget {
  const AboutDoctorWidget({
    super.key,
    required this.widget,
  });

  final DoctorDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'aboutDoctor'.tr(),
                    style: TextStyles.textStyle18.copyWith(),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.doctor['description'],
                    style: TextStyles.textStyle14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
