import 'package:delta/src/shared/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/dio_helper.dart';
part 'signup_domain.g.dart';

@riverpod
Future<void> signUp(SignUpRef ref,
    {required String userName,
    required String email,
    required String phone}) async {
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/users/signup", {"name": userName, "email": email, "phone": phone});

  if (request!.statusCode == 200) {
    ref.watch(goRouterProvider).push("/otp_verify", extra: email);
  }
}
