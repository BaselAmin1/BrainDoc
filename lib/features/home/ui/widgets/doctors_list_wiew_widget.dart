import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewWidget extends StatelessWidget {
  const DoctorsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('browseDoctors'.tr(), style: TextStyles.textStyle22),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'seeAll'.tr(),
                style: TextStyles.textStyle14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 160.w,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      Assets.assetsImagesOnboardingDoctor,
                      height: 160.h,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Card(
                          elevation: 2,
                          margin: const EdgeInsets.all(0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffC6D4F1),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.r),
                                bottomLeft: Radius.circular(8.r),
                                topLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Dr. John Doe',
                                      style: TextStyles.textStyle16),
                                  SizedBox(height: 0.h),
                                  const Text(
                                    '32 Dokki St., Dokki',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyles.textStyle14,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        '${'price'.tr()} ',
                                        style: TextStyles.textStyle14.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text('250£',
                                          style: TextStyles.textStyle14),
                                      const Spacer(),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      Text(
                                        ' 4.5',
                                        style: TextStyles.textStyle14.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 4.h),
      ],
    );
  }
}
