import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorImageAndNameAndPriceWidget extends StatelessWidget {
  const DoctorImageAndNameAndPriceWidget({
    super.key,
    required this.widget,
  });

  final DoctorDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.r),
            color: const Color.fromARGB(255, 193, 208, 255),
            border: Border.all(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: widget.doctor['image'],
            width: 120.w,
            height: 120.w,
          ),
        ),
        SizedBox(height: 16.w),
        Text(
          widget.doctor['name'],
          style: TextStyles.textStyle18,
        ),
        Text(
          widget.doctor['price'] + ' ' + 'egp'.tr(),
          style: TextStyles.textStyle16,
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
