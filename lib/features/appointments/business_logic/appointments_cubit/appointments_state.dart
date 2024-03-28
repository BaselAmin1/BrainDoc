part of 'appointments_cubit.dart';

sealed class AppointmentsState extends Equatable {
  const AppointmentsState();

  @override
  List<Object> get props => [];
}

final class AppointmentsInitial extends AppointmentsState {}

final class GetAppointmentsLoading extends AppointmentsState {}

final class GetAppointmentsLoaded extends AppointmentsState {

}

final class GetAppointmentsError extends AppointmentsState {
  final String errorMsg;

  const GetAppointmentsError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

final class AddRatingLoading extends AppointmentsState {}

final class AddRatingLoaded extends AppointmentsState {}

final class AddRatingError extends AppointmentsState {
  final String errorMsg;

  const AddRatingError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}