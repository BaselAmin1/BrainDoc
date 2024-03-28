import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorBookNowButton extends StatelessWidget {
  DoctorBookNowButton({
    super.key,
    required this.doctor,
  });
  DocumentSnapshot doctor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
            margin: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 0.w,
            ),
            text: 'bookNow'.tr(),
            onPressed: () {
              context.pushNamed(Routes.bookingScreen,
                  arguments: doctor,
                  );
            }),
        SizedBox(height: 8.h),
      ],
    );
  }
}
