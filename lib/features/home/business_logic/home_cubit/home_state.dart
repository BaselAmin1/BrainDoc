part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<DocumentSnapshot>? doctors;
  final List<DocumentSnapshot>? banners;

  const HomeState({
    required this.status,
    this.doctors,
    this.banners,
  });

  static HomeState initial() => const HomeState(
        status: HomeStatus.initial,
      );

  HomeState copyWith({
    HomeStatus? status,
    List<DocumentSnapshot>? doctors,
    List<DocumentSnapshot>? banners,
  }) =>
      HomeState(
        status: status ?? this.status,
        doctors: doctors ?? this.doctors,
        banners: banners ?? this.banners,
      );

  @override
  List<Object?> get props => [status, doctors, banners];
}
