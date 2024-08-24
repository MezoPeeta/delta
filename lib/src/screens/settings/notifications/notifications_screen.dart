import 'dart:developer';

import 'package:delta/src/providers/notification_provider.dart';
import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/settings/profile/profile_screen.dart';
import 'package:delta/src/shared/app_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(getNotificationsProvider);
    final isGuest = ref.watch(isGuestProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإشعارات"),
        centerTitle: true,
      ),
      body: isGuest
          ? const LoginRequiredWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: notifications.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const EmptyDataWidget(
                        text: "الإشعارات  فارغة!",
                        subText: "لم تقم بتلاقي اي اشعارات  بعد",
                      );
                    }
                    return ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index].title!),
                                  Text(data[index].body!),
                                ],
                              ),
                            ));
                  },
                  error: (e, s) {
                    log("[Error Notification]", error: e, stackTrace: s);

                    return const Center(child: Text("حدث خطأ ما"));
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()))),
    );
  }
}

class LoginRequiredWidget extends ConsumerStatefulWidget {
  const LoginRequiredWidget({
    super.key,
  });

  @override
  ConsumerState<LoginRequiredWidget> createState() =>
      _LoginRequiredWidgetState();
}

class _LoginRequiredWidgetState extends ConsumerState<LoginRequiredWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomSheet(
          context: context,
          builder: (context) {
            return LoginRequiredDialog(context);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.lock));
  }
}

SizedBox LoginRequiredDialog(BuildContext context) {
  return SizedBox(
    height: 450,
    child: Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        const Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                "تسجيل الدخول",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Align(alignment: Alignment.topRight, child: CloseButton()),
          ],
        ),
        const Divider(),
        const SizedBox(
          height: 24,
        ),
        SvgPicture.asset("assets/img/icons/warning.svg"),
        const SizedBox(
          height: 24,
        ),
        const Text(
          "تسجيل الدخول",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 8,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "من اجل اتمام العملية يجيب عليك تسجيل الدخول او انشاء حساب جديد",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 54),
                  child: ElevatedButton(
                      onPressed: () {
                        context.push("/signin");
                        context.pop();
                      },
                      child: const Text("تسجيل الدخول")),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 54),
                  child: OutlinedButton(
                      onPressed: () {
                        context.push("/signup");
                        context.pop();
                      },
                      child: const Text("انشاء حساب")),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
    required this.text,
    required this.subText,
  });
  final String text;
  final String subText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/img/icons/no_address.svg"),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(
          subText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
