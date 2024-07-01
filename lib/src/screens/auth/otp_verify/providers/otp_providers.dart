import 'package:delta/src/shared/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/dio_helper.dart';

part 'otp_providers.g.dart';

final isResetPasswordProvider = StateProvider<bool>((ref) {
  return false;
});

@riverpod
Future<void> sendOTP(SendOTPRef ref, {required String email}) async {
  final request =
      await ref.watch(dioHelperProvider).postHTTP("/api/otp/send-otp", {
    "email": email,
  });
}

@riverpod
Future<void> verifyOTP(
  VerifyOTPRef ref, {
  required String email,
  required String otp,
}) async {
  final request = await ref
      .watch(dioHelperProvider)
      .postHTTP("/api/otp/verify-otp", {"email": email, "otp": otp});
}
