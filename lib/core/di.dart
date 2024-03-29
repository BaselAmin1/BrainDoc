import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/shared/localization_cubit/localization_cubit.dart';
import 'package:BrainDoc/features/appointments/business_logic/appointments_cubit/appointments_cubit.dart';
import 'package:BrainDoc/features/booking/business_logic/booking_cubit/booking_cubit.dart';
import 'package:BrainDoc/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:BrainDoc/features/main_layout/business_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:BrainDoc/features/payment/business_logic/confirm_booking_cubit/confirm_booking_cubit.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt
      .registerLazySingleton<CacheHelper>(() => CacheHelper(sharedPreferences));

  getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerFactory<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerFactory<FirebaseStorage>(() => FirebaseStorage.instance);
  getIt.registerFactory<FirebaseMessaging>(() => FirebaseMessaging.instance);

  getIt.registerFactory<LocalizationCubit>(() => LocalizationCubit());
  getIt.registerLazySingleton<PhoneAuthCubit>(() => PhoneAuthCubit());
  getIt.registerFactory<NewUserCubit>(() => NewUserCubit());
  getIt.registerFactory<MainLayoutCubit>(() => MainLayoutCubit());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<BookingCubit>(() => BookingCubit());
  getIt.registerFactory<ConfirmBookingCubit>(() => ConfirmBookingCubit());
  getIt.registerFactory<AppointmentsCubit>(() => AppointmentsCubit());
}
