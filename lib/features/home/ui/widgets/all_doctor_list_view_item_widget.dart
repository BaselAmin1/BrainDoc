import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorListViewItemWidget extends StatelessWidget {
  AllDoctorListViewItemWidget({super.key, required this.doctor});

  var doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: doctor['image'],
              height: 120.h,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(doctor['name'], style: TextStyles.textStyle16),
                SizedBox(height: 12.h),
                Text(
                  doctor['address'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyles.textStyle14,
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      '${'price'.tr()} ',
                      style: TextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(doctor['price'], style: TextStyles.textStyle14),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
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
          ],
        ),
      ),
    );
  }
}
