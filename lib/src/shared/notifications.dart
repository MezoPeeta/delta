import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_api_availability/google_api_availability.dart';

class FirebaseNotifications {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  init() async {
    if(Platform.isIOS){
      await _messaging.requestPermission();
      final token = await getToken();
      log("Token $token");
    }
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
