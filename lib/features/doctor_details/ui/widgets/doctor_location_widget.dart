import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorLocationWidget extends StatelessWidget {
  DoctorLocationWidget({
    super.key,
    required this.widget,
  required  this.mapController,
  required  this.marker,
  });

  final DoctorDetailsScreen widget;
  var mapController;
  Set<Marker> marker;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'workLocation'.tr(),
                    style: TextStyles.textStyle18.copyWith(),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.doctor['address'],
                    style: TextStyles.textStyle14,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: const Color.fromARGB(255, 193, 208, 255),
                    ),
                    width: double.infinity,
                    height: 150.h,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(widget.doctor['location'].latitude,
                            widget.doctor['location'].longitude),
                        zoom: 15,
                      ),
                      myLocationButtonEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                      markers: marker,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
