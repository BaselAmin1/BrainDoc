import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/cache_helper/cache_values.dart';
import 'package:BrainDoc/core/di.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  final _fcm = FirebaseMessaging.instance;
  String? fCMToken;

  Future<void> initializeNotification() async {
    if (getIt<CacheHelper>().getData(
          key: CacheKeys.deviceToken,
        ) ==
        null) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      await _fcm.requestPermission();
      await _fcm.getAPNSToken();
      fCMToken = await _fcm.getToken();
      await _fcm.subscribeToTopic("users");
      await getIt<CacheHelper>()
          .saveData(key: CacheKeys.deviceToken, value: fCMToken);
      
    }
  }
}
