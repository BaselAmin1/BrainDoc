import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({
    super.key,
    required this.doctor,
  });

  final DocumentSnapshot doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            imageUrl: doctor['image'],
            width: 60.w,
            height: 60.w,
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor['name'],
              style: TextStyles.textStyle18,
            ),
            Row(
              children: [
                Text(
                  '${'rating'.tr()} ',
                  style: TextStyles.textStyle16.copyWith(
                    color: Colors.grey,
                  ),
                ),
                RatingBarIndicator(
                  rating: double.parse(doctor['rating']),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Text(
                  ' ' + doctor['rating'],
                  style: TextStyles.textStyle16.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
