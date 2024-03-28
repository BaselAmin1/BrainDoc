import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/booking/business_logic/booking_cubit/booking_cubit.dart';
import 'package:BrainDoc/features/booking/ui/widgets/booking_days_widget.dart';
import 'package:BrainDoc/features/booking/ui/widgets/booking_notes_widget.dart';
import 'package:BrainDoc/features/booking/ui/widgets/booking_submit_button.dart';
import 'package:BrainDoc/features/booking/ui/widgets/booking_time_widget.dart';
import 'package:BrainDoc/features/booking/ui/widgets/booking_top_texts_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({
    super.key,
    required this.doctor,
  });

  DateTime selectedValue = DateTime.now();

  final DocumentSnapshot doctor;
  String dayOfWeek = DateFormat('EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'makeAppointment'.tr(),
              style: TextStyles.textStyle22,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BookingTopTextsWidget(),
                  BookingDaysWidget(
                      selectedValue: selectedValue,
                      dayOfWeek: dayOfWeek,
                      doctorDates: doctor['dates']),
                  const BookingTimeWidget(),
                  const BookingNotesWidget(),
                ],
              ),
            ),
          ),
          bottomNavigationBar:  BookingSubmitButton(
            doctor:doctor,
          ),
        );
      },
    );
  }
}
