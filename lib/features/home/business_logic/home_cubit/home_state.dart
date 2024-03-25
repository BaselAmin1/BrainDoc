part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}


final class GetDoctorsLoading extends HomeState {}

final class GetDoctorsSuccess extends HomeState {
  final List<DocumentSnapshot> doctors;

  const GetDoctorsSuccess(this.doctors);

  @override
  List<Object> get props => [doctors];
}

final class GetDoctorsFailure extends HomeState {
  final String errorMessage;

  const GetDoctorsFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class GetBannersLoading extends HomeState {}

final class GetBannersSuccess extends HomeState {
  final List<DocumentSnapshot> banners;

  const GetBannersSuccess(this.banners);

  @override
  List<Object> get props => [banners];
}

final class GetBannersFailure extends HomeState {
  final String errorMessage;

  const GetBannersFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}