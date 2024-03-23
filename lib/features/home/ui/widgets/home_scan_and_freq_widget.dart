import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScanAndFreqWidget extends StatelessWidget {
  const HomeScanAndFreqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            width: 165.w,
            height: 165.h,
            decoration: BoxDecoration(
              color: const Color(0xffF9F5FF),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesHomeFrequencyQuestionsImage,
                  width: 45.w,
                  height: 45.h,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'fastQuestions'.tr(),
                  style: TextStyles.textStyle18,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'frequencyQuestionsAboutBrainTumor'.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            width: 165.w,
            height: 165.h,
            decoration: BoxDecoration(
              color: const Color(0xffEDFCF2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesHomeScanImageSvg,
                  width: 45.w,
                  height: 45.h,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'scanMRI'.tr(),
                  style: TextStyles.textStyle18,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'scanYourMRIToGetFastResult'.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
