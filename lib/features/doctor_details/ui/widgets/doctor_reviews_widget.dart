import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorReviewsWidget extends StatelessWidget {
  const DoctorReviewsWidget({
    super.key,
    required this.widget,
    required this.rating,
  });

  final DoctorDetailsScreen widget;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'reviews'.tr()} (${widget.doctor['reviews'].length})',
                    style: TextStyles.textStyle18.copyWith(),
                  ),
                  SizedBox(height: 8.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.doctor['reviews'].length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.w,
                                height: 50.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.circular(16.r),
                                  color: const Color.fromARGB(
                                      255, 193, 208, 255),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.doctor['reviews']
                                      [index]['patientImage'],
                                  fit: BoxFit.cover,
                                  width: 50.w,
                                  height: 50.w,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' ' +
                                        widget.doctor['reviews']
                                            [index]['patientName'],
                                    style: TextStyles.textStyle16,
                                  ),
                                  RatingBarIndicator(
                                    rating: rating!,
                                    itemBuilder: (context, index) =>
                                        const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    ' ' +
                                        widget.doctor['reviews']
                                            [index]['patientReview'],
                                    style: TextStyles.textStyle14,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.doctor['reviews'][index]
                                          ['date'],
                                      style: TextStyles.textStyle14
                                          .copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '\n',
                                      style: TextStyles.textStyle14
                                          .copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8.h),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1.5,
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

