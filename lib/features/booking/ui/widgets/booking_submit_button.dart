import 'package:BrainDoc/core/functions/easy_loading.dart';
import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/app_router.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/features/booking/business_logic/booking_cubit/booking_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingSubmitButton extends StatelessWidget {
  const BookingSubmitButton({
    super.key,
    required this.doctor,
  });
  final DocumentSnapshot doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 32.h, horizontal: 32.w),
      child: CustomButton(
        text: 'submit'.tr(),
        onPressed: () {
          if (context.read<BookingCubit>().selectedTimeIndex == -1) {
            showError(
              'pleaseSelectTime'.tr(),
            );
            return;
          } else {
            context.pushNamed(
              Routes.paymentSummaryScreen,
              arguments: PaymentSummaryModel(
                doctor: doctor,
                date: context.read<BookingCubit>().selectedDay,
                time: context
                    .read<BookingCubit>()
                    .selectedDayTimes[
                        context.read<BookingCubit>().selectedTimeIndex]
                    .time,
              ),
            );
          }
        },
      ),
    );
  }
}
