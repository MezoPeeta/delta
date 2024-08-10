import 'package:delta/src/shared/cache_helper.dart';
import 'package:delta/src/shared/notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/shared/firebase_options.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const ProviderScope(child: MyApp()));
  await Firebase.initializeApp(
    // name: "devproject",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotifications().init();
}
