import 'package:delta/src/screens/auth/complete_pass/complete_pass.dart';
import 'package:delta/src/screens/auth/login/data/user.dart';
import 'package:delta/src/screens/auth/new_pass/new_pass.dart';
import 'package:delta/src/screens/auth/otp_verify/otp_verify.dart';
import 'package:delta/src/screens/auth/reset_pass/reset_pass.dart';
import 'package:delta/src/screens/auth/signup/signup_screen.dart';
import 'package:delta/src/screens/boarding/boarding_screen.dart';
import 'package:delta/src/screens/bookings/data/order.dart';
import 'package:delta/src/screens/products/product_detail.dart';
import 'package:delta/src/screens/settings/addresses/data/address.dart';
import 'package:delta/src/screens/settings/change_pass/change_pass.dart';
import 'package:delta/src/screens/settings/feedback/feedback_screen.dart';
import 'package:delta/src/screens/settings/profile/profile_screen.dart';
import 'package:delta/src/shared/navigation.dart';
import 'package:delta/src/shared/storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth/login/signin_screen.dart';
import '../screens/order/order_screen.dart';
import '../screens/products/data/product.dart';
import '../screens/products/products_screen.dart';
import '../screens/settings/about/about_screen.dart';
import '../screens/settings/addresses/add_address_screen.dart';
import '../screens/settings/addresses/addresses_screen.dart';
import '../screens/settings/contact/contact_screen.dart';
import '../screens/settings/notifications/notifications_screen.dart';

final goRouterProvider = StateProvider<GoRouter>((ref) => _routes);

final tokenProvider = FutureProvider<String?>((ref) async {
  final token = ref.watch(tokenSProvider);
  if (token != null) {
    return token;
  }
  return await StorageRepository().read(key: "token");
});

final tokenSProvider = StateProvider<String?>((ref) => null);

final _routes = GoRouter(initialLocation: '/boarding', routes: [
  GoRoute(path: "/", builder: (context, state) => const Navigation()),
  GoRoute(
      path: "/order",
      builder: (context, state) => OrderScreen(order: state.extra as Order)),
  GoRoute(
      path: "/boarding", builder: (context, state) => const BoardingScreen()),
  GoRoute(path: "/signin", builder: (context, state) => const SignInScreen()),
  GoRoute(path: "/signup", builder: (context, state) => const SignupScreen()),
  GoRoute(
      path: "/reset_pass",
      builder: (context, state) => const ResetPasswordScreen()),
  GoRoute(
      path: "/otp_verify",
      builder: (context, state) => OtpVerifyScreen(
            email: state.extra as String,
          )),
  GoRoute(
      path: "/pass_confirm",
      builder: (context, state) => CompletePassScreen(
            email: state.extra as String,
          )),
  GoRoute(
      path: "/new_pass",
      builder: (context, state) => NewPassScreen(
            email: state.extra as String,
          )),
  GoRoute(
      path: "/feedback", builder: (context, state) => const FeedbackScreen()),
  GoRoute(
      path: "/change_pass",
      builder: (context, state) => const ChangePasswordScreen()),
  GoRoute(path: "/about", builder: (context, state) => const AboutScreen()),
  GoRoute(
      path: "/addresses", builder: (context, state) => const AddressesScreen()),
  GoRoute(
      path: "/notifications",
      builder: (context, state) => const NotificationsScreen()),
  GoRoute(
      path: "/profile",
      builder: (context, state) => ProfileScreen(
            user: state.extra as User,
          )),
  GoRoute(
      path: "/add_address",
      builder: (context, state) => AddAddressScreen(state.extra as Address?)),
  GoRoute(
      path: "/products", builder: (context, state) => const ProductsScreen()),
  GoRoute(path: "/contact", builder: (context, state) => const ContactScreen()),
  GoRoute(
      path: "/products/detail",
      builder: (context, state) => ProductDetail(
            product: state.extra as Product,
          )),
]);
