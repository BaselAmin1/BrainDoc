part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final DocumentSnapshot user;

  const ProfileLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateUserLoadingState extends ProfileState {}

class UpdateUserSuccessState extends ProfileState {}

class UpdateUserErrorState extends ProfileState {
  final String error;
  const UpdateUserErrorState(this.error);
}

class PickImageLoadingState extends ProfileState {}

class PickImageSuccessState extends ProfileState {}

class PickImageErrorState extends ProfileState {
  final String error;
  const PickImageErrorState(this.error);
}

class UploadImageLoadingState extends ProfileState {}

class UploadImageSuccessState extends ProfileState {}

class UploadImageErrorState extends ProfileState {
  final String error;
  const UploadImageErrorState(this.error);
}
