import 'package:BrainDoc/features/booking/data/models/day_time_model.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(const BookingState(status: BookingStatus.initial));

  List<DayTime> selectedDayTimes = [];
  int selectedTimeIndex = -1;
  TextEditingController notesController = TextEditingController();
  String selectedDay = DateFormat().add_yMMMEd().format(DateTime.now());

  onSelectDate({
    required doctorDates,
    required String dayOfWeek,
  }) {
    emit(state.copyWith(
      selectedWeekDay: dayOfWeek,
      status: BookingStatus.loading,
    ));
    selectedDayTimes = [];
    for (var date in doctorDates!) {
      if (date['weekDay'] == dayOfWeek) {
        var dayTimes = date['dateTimes'].toList();
        for (var dayTime in dayTimes) {
          selectedDayTimes.add(
            DayTime(
              time: dayTime['time'],
              timeBooked: dayTime['timeBooked'],
            ),
          );
          
          
          
        }
        break;
      }
    }

    emit(state.copyWith(
      selectedWeekDay: dayOfWeek,
      status: BookingStatus.loaded,
    ));
  }

  onSelectTime({required int selectedTimeIndex}) {
    emit(state.copyWith(
        selectedTimeIndex: selectedTimeIndex, status: BookingStatus.loading));
    this.selectedTimeIndex = selectedTimeIndex;
    emit(state.copyWith(
        selectedTimeIndex: selectedTimeIndex, status: BookingStatus.loaded));
  }

  bool checkAvailableTime(String time) {
    for (var dayTime in selectedDayTimes) {
      if (dayTime.time == time) {
        
        
        

        DateTime dateTime = DateFormat("E, MMM d, yyyy").parse(selectedDay);

        String formattedDate = DateFormat("yyyy-M-d").format(dateTime);
        if (dayTime.timeBooked.contains(formattedDate)) {
          return false;
        } else {
          return true;
        }
      }
    }
    return false;
  }
}
