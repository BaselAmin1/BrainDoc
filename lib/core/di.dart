import 'package:BrainDoc/core/shared/localization_cubit/localization_cubit.dart';
import 'package:BrainDoc/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:BrainDoc/features/main_layout/business_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<LocalizationCubit>(() => LocalizationCubit());
  getIt.registerLazySingleton<PhoneAuthCubit>(() => PhoneAuthCubit());
  getIt.registerFactory<NewUserCubit>(() => NewUserCubit());
  getIt.registerFactory<MainLayoutCubit>(() => MainLayoutCubit());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
    getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
