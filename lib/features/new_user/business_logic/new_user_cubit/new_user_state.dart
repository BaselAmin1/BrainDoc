part of 'new_user_cubit.dart';

sealed class NewUserState extends Equatable {
  const NewUserState();

  @override
  List<Object> get props => [];
}

final class NewUserInitial extends NewUserState {}

final class UpdateNewUserDataLoading extends NewUserState {}

final class UpdateNewUserDataSuccess extends NewUserState {}

final class UpdateNewUserDataFailed extends NewUserState {
  final String errorMsg;

  const UpdateNewUserDataFailed({required this.errorMsg});
}
