import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:BrainDoc/features/home/ui/widgets/doctors_list_wiew_widget.dart';
import 'package:BrainDoc/features/home/ui/widgets/home_banners_widget.dart';
import 'package:BrainDoc/features/home/ui/widgets/home_scan_and_freq_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomButton(
                    //   text: 'Add Data',
                    //   onPressed: () {
                    //     FirebaseFirestore.instance.collection('doctors').add({
                    //       "image":
                    //           "https://firebasestorage.googleapis.com/v0/b/braindoc-129c4.appspot.com/o/Doctors_Images%2Fdoc_1.png?alt=media&token=b6ef5a72-c8c0-4752-887e-e836ca2a1411",
                    //       "address": "123 Luxor East Bank, Luxor, Egypt",
                    //       "reviews": [],
                    //       "price": "550",
                    //       "name": "Dr. Tarek El-Masry",
                    //       "rating": "4.5",
                    //       "description":
                    //           "Orthopedic surgeon specializing in sports injuries with over 18 years of experience",
                    //       "isHospital": true,
                    //       "hospitalName": "Luxor Orthopedic Center",
                    //       "location": {
                    //         "latitude": 25.6872,
                    //         "longitude": 32.6396
                    //       },
                    //       "dates": [
                    //         {
                    //           "dateTimes": [
                    //             {"timeBooked": [], "time": "9 AM"},
                    //             {"timeBooked": [], "time": "9:30 AM"},
                    //             {"timeBooked": [], "time": "10 AM"},
                    //             {"timeBooked": [], "time": "10:30 AM"},
                    //             {"timeBooked": [], "time": "11 AM"},
                    //             {"timeBooked": [], "time": "11:30 AM"},
                    //             {"timeBooked": [], "time": "12 PM"}
                    //           ],
                    //           "weekDay": "Tuesday"
                    //         },
                    //         {
                    //           "dateTimes": [
                    //             {"timeBooked": [], "time": "1 PM"},
                    //             {"timeBooked": [], "time": "1:30 PM"},
                    //             {"timeBooked": [], "time": "2 PM"},
                    //             {"timeBooked": [], "time": "2:30 PM"},
                    //             {"timeBooked": [], "time": "3 PM"},
                    //             {"timeBooked": [], "time": "3:30 PM"},
                    //             {"timeBooked": [], "time": "4 PM"}
                    //           ],
                    //           "weekDay": "Monday"
                    //         },
                    //         {
                    //           "dateTimes": [
                    //             {"timeBooked": [], "time": "9 AM"},
                    //             {"timeBooked": [], "time": "9:30 AM"},
                    //             {"timeBooked": [], "time": "10 AM"},
                    //             {"timeBooked": [], "time": "10:30 AM"},
                    //             {"timeBooked": [], "time": "11 AM"},
                    //             {"timeBooked": [], "time": "11:30 AM"},
                    //             {"timeBooked": [], "time": "12 PM"}
                    //           ],
                    //           "weekDay": "Friday"
                    //         },
                    //       ]
                    //     }).then((_) {
                    //       print('Document added with custom ID');
                    //     }).catchError((error) {
                    //       print('Error adding document: $error');
                    //     });
                    //   },
                    // ),
                     ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        '${'hello'.tr()} ${getIt<FirebaseAuth>().currentUser?.displayName?.split(" ")[0]}',
                        style: TextStyles.textStyle22,
                      ),
                      subtitle: Text(
                        'mayYouAlwaysInAGoodCondition'.tr(),
                        style: TextStyles.textStyle16,
                      ),
                    ),
                    const HomeScanAndFreqWidget(),
                    const DoctorsListViewWidget(),
                    const BannerWidget(),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
