import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListViewItemWidget extends StatelessWidget {
  DoctorListViewItemWidget({super.key, required this.doctor});

  var doctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        Routes.doctorDetailsScreen,
        arguments: doctor,
      ),
      child: Container(
        width: 190.w,
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: doctor['image'],
              height: 155.h,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3, left: 3),
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
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
                          Text(
                            doctor['name'],
                            style: TextStyles.textStyle16,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(height: 0.h),
                          Text(
                            doctor['address'],
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
                              Text(doctor['price'],
                                  style: TextStyles.textStyle14),
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                doctor['rating'],
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
      ),
    );
  }
}
