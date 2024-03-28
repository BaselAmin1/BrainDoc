import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/doctor_details/ui/widgets/about_doctor_widget.dart';
import 'package:BrainDoc/features/doctor_details/ui/widgets/doctor_book_now_button.dart';
import 'package:BrainDoc/features/doctor_details/ui/widgets/doctor_hospital_or_clinic_widget.dart';
import 'package:BrainDoc/features/doctor_details/ui/widgets/doctor_image_and_name_and_price_widget.dart';
import 'package:BrainDoc/features/doctor_details/ui/widgets/doctor_location_widget.dart';
import 'package:BrainDoc/features/doctor_details/ui/widgets/doctor_reviews_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({
    super.key,
    required this.doctor,
  });
  final DocumentSnapshot doctor;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  GoogleMapController? mapController;

  final Set<Marker> _markers = {};

  double? rating = 0;
  calcRating() {
    for (var review in widget.doctor['reviews']) {
      rating = (rating! + double.parse(review['patientRating'].toString()));
    }
    rating = double.parse(
        (rating! / widget.doctor['reviews'].length).toStringAsFixed(2));
  }

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: const MarkerId('initialLocation'),
        position: LatLng(widget.doctor['location'].latitude,
            widget.doctor['location'].longitude),
        infoWindow: InfoWindow(
          title: widget.doctor['hospitalName'],
          snippet: widget.doctor['address'],
        ),
      ),
    );

    calcRating();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    mapController?.dispose();
    rating = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'doctorProfile'.tr(),
          style: TextStyles.textStyle22,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DoctorImageAndNameAndPriceWidget(widget: widget),
              DoctorHospitalOrClinicWidget(widget: widget),
              AboutDoctorWidget(widget: widget),
              DoctorLocationWidget(
                widget: widget,
                mapController: mapController,
                marker: _markers,
              ),
              DoctorReviewsWidget(widget: widget, rating: rating),
              DoctorBookNowButton(
                doctor: widget.doctor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
