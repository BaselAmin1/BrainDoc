import 'package:bloc/bloc.dart';
import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  Future<void> changeLanguage({
    required context,
  }) async {
    emit(LocalizationLoading());
    var localization = EasyLocalization.of(context);
    var lang = localization!.locale == const Locale('ar', 'EG') ? 'en' : 'ar';
    var country = localization.locale == const Locale('ar', 'EG') ? 'UK' : 'EG';

    await localization.setLocale(Locale(lang, country));
    lang == 'ar'
        ? CacheHelper.changeLanguageToAr()
        : CacheHelper.changeLanguageToEn();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(LocalizationChange());
      },
    );
  }
}
