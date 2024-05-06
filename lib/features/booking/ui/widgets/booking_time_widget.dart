import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/booking/business_logic/booking_cubit/booking_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingTimeWidget extends StatelessWidget {
  const BookingTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'selectedTime'.tr(),
          style: TextStyles.textStyle22,
        ),
        BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return SizedBox(
              height: 50.h,
              child: context.read<BookingCubit>().selectedDayTimes.isEmpty
                  ? Center(
                      child: Text(
                        'noAvailableAppointmentsInThisDay'.tr(),
                        style: TextStyles.textStyle16,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:
                          context.read<BookingCubit>().selectedDayTimes.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            !context.read<BookingCubit>().checkAvailableTime(
                                    context
                                        .read<BookingCubit>()
                                        .selectedDayTimes[index]
                                        .time)
                                ? null
                                : context
                                    .read<BookingCubit>()
                                    .onSelectTime(selectedTimeIndex: index);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 110.w,
                                margin: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 8.w,
                                ),
                                decoration: BoxDecoration(
                                  color: context
                                              .read<BookingCubit>()
                                              .selectedTimeIndex ==
                                          index
                                      ? AppColors.primaryColor
                                      : !context
                                              .read<BookingCubit>()
                                              .checkAvailableTime(context
                                                  .read<BookingCubit>()
                                                  .selectedDayTimes[index]
                                                  .time)
                                          ? Colors.grey[50]
                                          : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Text(
                                    context
                                        .read<BookingCubit>()
                                        .selectedDayTimes[index]
                                        .time,
                                    style: TextStyles.textStyle22.copyWith(
                                      color: context
                                                  .read<BookingCubit>()
                                                  .selectedTimeIndex ==
                                              index
                                          ? Colors.white
                                          : !context
                                                  .read<BookingCubit>()
                                                  .checkAvailableTime(
                                                    context
                                                        .read<BookingCubit>()
                                                        .selectedDayTimes[index]
                                                        .time,
                                                  )
                                              ? Colors.grey[600]
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              !context.read<BookingCubit>().checkAvailableTime(
                                      context
                                          .read<BookingCubit>()
                                          .selectedDayTimes[index]
                                          .time)
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Center(
                                        child: Text(
                                          'x',
                                          style:
                                              TextStyles.textStyle30.copyWith(
                                            color: Colors.red,
                                            fontSize: 34,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        );
                      },
                    ),
            );
          },
        ),
      ],
    );
  }
}
