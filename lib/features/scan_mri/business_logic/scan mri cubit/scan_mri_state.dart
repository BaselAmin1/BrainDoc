part of 'scan_mri_cubit.dart';

sealed class ScanMriState extends Equatable {
  const ScanMriState();

  @override
  List<Object> get props => [];
}

final class ScanMriInitial extends ScanMriState {}

class PickImageSuccessState extends ScanMriState {}

class PickImageErrorState extends ScanMriState {
  final String error;

  const PickImageErrorState(this.error);
}

class UploadImageSuccess extends ScanMriState {}

class UploadImageError extends ScanMriState {}

class UploadImageLoading extends ScanMriState {}

class ShowLoading extends ScanMriState {}

class FinishLoading extends ScanMriState {}
