import 'package:delta/src/screens/auth/login/data/user.dart';
import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/bookings/bookings_screen.dart';
import 'package:delta/src/shared/hyperlink_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Container(
                  width: 202,
                  height: 174,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/img/brand_logo_big.png"))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "تابع خطوات تركيب مصعدك بسلاسة ودقة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 54),
                child: ElevatedButton(
                    onPressed: () => context.push("/signin"),
                    child: const Text("تسجيل الدخول")),
              ),
              const SizedBox(
                height: 12,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 54),
                child: OutlinedButton(
                    onPressed: () => context.push("/signup"),
                    child: const Text("انشاء حساب جديد")),
              ),
              const SizedBox(
                height: 12,
              ),
              Consumer(builder: (context, ref, child) {
                return HyperLinkWidget(
                  text: "الدخول كزائر",
                  onTap: () {
                    ref.read(userProvider.notifier).state = const User([],
                        id: "id",
                        name: "زائر",
                        email: "email",
                        role: "role",
                        phone: "phone",
                        isUserHasContract: false,
                        isUserHasMaintenanceRequest: false);
                    context.go("/");
                  },
                  fontSize: 16,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
