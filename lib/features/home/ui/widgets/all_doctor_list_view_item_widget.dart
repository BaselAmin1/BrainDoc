import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/routes.dart';
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
    return InkWell(
      onTap: () => context.pushNamed(
        Routes.doctorDetailsScreen,
        arguments: doctor,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: CachedNetworkImage(
                  imageUrl: doctor['image'],
                  height: 120.h,
                  width: 120.w,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(doctor['name'], style: TextStyles.textStyle16),
                    SizedBox(height: 8.h),
                    Text(
                      doctor['address'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.textStyle14,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ),
      ),
    );
  }
}
