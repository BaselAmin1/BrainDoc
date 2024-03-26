import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cache_values.dart';

class CacheHelper {
  late SharedPreferences sharedPreferences;

  CacheHelper(this.sharedPreferences);

  dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  bool isEnglish() => getCurrentLanguage() == "en";

  void changeLanguageToEn() async {
    await saveData(key: CacheKeys.currentLanguage, value: "ltr");
  }

  String getCurrentLanguage() {
    return getData(key: CacheKeys.currentLanguage) ?? "ltr";
  }

  void changeLanguageToAr() async {
    await saveData(key: CacheKeys.currentLanguage, value: "rtl");
  }

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }
}


