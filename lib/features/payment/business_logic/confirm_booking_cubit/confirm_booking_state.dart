part of 'confirm_booking_cubit.dart';

sealed class ConfirmBookingState extends Equatable {
  const ConfirmBookingState();

  @override
  List<Object> get props => [];
}

final class ConfirmAppointmentInitial extends ConfirmBookingState {}

final class ConfirmAppointmentLoading extends ConfirmBookingState {}

final class ConfirmAppointmentLoaded extends ConfirmBookingState {}

final class ConfirmAppointmentError extends ConfirmBookingState {
  final String errorMsg;

  const ConfirmAppointmentError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
