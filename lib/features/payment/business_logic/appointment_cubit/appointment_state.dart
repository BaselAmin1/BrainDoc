part of 'appointment_cubit.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentLoaded extends AppointmentState {}

final class AppointmentError extends AppointmentState {
  final String errorMsg;

  const AppointmentError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
