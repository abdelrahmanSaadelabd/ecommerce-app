import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer().play(
      android: AndroidSounds.notification,
      ios: IosSounds.glass,
      looping: true,
      volume: 0.1,
      asAlarm: false,
    );

    Get.snackbar(
      message.notification?.title ?? "No Title",
      message.notification?.body ?? "No Body",
      snackPosition: SnackPosition.TOP,
    );

    if (message.data["pagename"] == "order" && Get.currentRoute == "/order") {}
  });
}
