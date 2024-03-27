import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorBookNowButton extends StatelessWidget {
  const DoctorBookNowButton({
    super.key,
  });

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
            onPressed: () {}),
        SizedBox(height: 8.h),
      ],
    );
  }
}