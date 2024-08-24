import 'dart:async';

import 'package:delta/src/shared/cache_helper.dart';
import 'package:delta/src/shared/notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/shared/firebase_options.dart';
import 'src/app.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheHelper.init();

    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://82ab9ac15e27500841a628efe588d335@o4507833789710336.ingest.de.sentry.io/4507833791479888';
      },
    );

    runApp(const ProviderScope(child: MyApp()));
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });

  await Firebase.initializeApp(
    // name: "devproject",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotifications().init();
}
