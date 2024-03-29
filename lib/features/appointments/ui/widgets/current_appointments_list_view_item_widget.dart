import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentAppointmentsListViewItemWidget extends StatelessWidget {
  const CurrentAppointmentsListViewItemWidget({
    super.key,
    required this.appointments,
    required this.index,
  });

  final List appointments;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
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
              imageUrl: appointments[index]['doctorImage'],
              width: 60.w,
              height: 60.w,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointments[index]['doctorName'],
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
                    rating:
                        double.parse(appointments[index]['rating'] ?? '0.0'),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  appointments[index]['rating'] != null
                      ? Text(
                          ' ' + appointments[index]['rating'],
                          style: TextStyles.textStyle16.copyWith(
                            color: Colors.grey,
                          ),
                        )
                      : Text(
                          ' ' '0.0',
                          style: TextStyles.textStyle16.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                ],
              ),
              Text(
                appointments[index]['date'] + ' ' + appointments[index]['time'],
                style: TextStyles.textStyle16.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
