part of 'booking_cubit.dart';

enum BookingStatus {
  initial,
  loading,
  loaded,
  error,
}

class BookingState extends Equatable {
  final BookingStatus status;
  final String selectedWeekDay;
  final int selectedTimeIndex;

  const BookingState({
    required this.status,
    this.selectedWeekDay = '',
    this.selectedTimeIndex = 0,
  });

  static BookingState initial() => const BookingState(
        status: BookingStatus.initial,
      );

  BookingState copyWith({
    BookingStatus? status,
    String? selectedWeekDay,
    int? selectedTimeIndex,
  }) =>
      BookingState(
        status: status ?? this.status,
        selectedTimeIndex: selectedTimeIndex ?? this.selectedTimeIndex,
        selectedWeekDay: selectedWeekDay ?? this.selectedWeekDay,
      );

  @override
  List<Object?> get props => [
        status,
        selectedWeekDay,
        selectedTimeIndex,
      ];
}
