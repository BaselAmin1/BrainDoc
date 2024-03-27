import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorHospitalOrClinicWidget extends StatelessWidget {
  const DoctorHospitalOrClinicWidget({
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SvgPicture.asset(Assets.assetsImagesHospitalIcon),
                SizedBox(width: 8.w),
                Text(
                  widget.doctor['isHospital'] ? 'hospital'.tr() : 'clinic'.tr(),
                  style: TextStyles.textStyle16.copyWith(),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              width: 1.5.w,
              height: 50.h,
              color: Colors.grey,
            ),
            Text(
              widget.doctor['hospitalName'],
              style: TextStyles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
