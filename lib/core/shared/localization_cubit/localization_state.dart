part of 'localization_cubit.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();

  @override
  List<Object> get props => [];
}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationLoading extends LocalizationState {}

final class LocalizationChange extends LocalizationState {}