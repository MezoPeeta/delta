import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_api_availability/google_api_availability.dart';

class FirebaseNotifications {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  init() async {
    GooglePlayServicesAvailability availability = await GoogleApiAvailability
        .instance
        .checkGooglePlayServicesAvailability();
      log("[Google Play Services] $availability");
    if (availability == GooglePlayServicesAvailability.success) {
      await _messaging.requestPermission();
      final token = await getToken();
      log("Token $token");
    }
  }

  Future<String?> getToken() async {
    return _messaging.getToken();
  }
}
