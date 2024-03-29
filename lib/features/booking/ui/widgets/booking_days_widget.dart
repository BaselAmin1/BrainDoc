import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/booking/business_logic/booking_cubit/booking_cubit.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDaysWidget extends StatelessWidget {
  BookingDaysWidget({
    super.key,
    required this.selectedValue,
    required this.dayOfWeek,
    required this.doctorDates,
  });
  DateTime selectedValue;
  String dayOfWeek;
  List doctorDates;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'selectedDate'.tr(),
          style: TextStyles.textStyle22,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: DatePicker(
            height: 90.h,
            width: 60.w,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
               context.read<BookingCubit>().selectedTimeIndex = -1;
              context.read<BookingCubit>().selectedDay =
                  DateFormat().add_yMMMEd().format(date);
              selectedValue = date;
              dayOfWeek = DateFormat('EEEE').format(selectedValue);
              context.read<BookingCubit>().onSelectDate(
                    doctorDates: doctorDates,
                    dayOfWeek: dayOfWeek,
                  );
              
              
            },
          ),
        ),
        SizedBox(height: 0.h),
      ],
    );
  }
}
