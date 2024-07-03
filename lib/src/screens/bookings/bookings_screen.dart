import 'package:delta/src/screens/settings/notifications/notifications_screen.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isSettings: false,
        title: "الحجوزات",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const EmptyDataWidget(
                text: "الحجوزات  فارغة!",
                subText:
                    "لم تقم بحجز اي مصعد بعد , نحن في انتظار طلباتك عزيزي العميل قم باستكشاف منتجاتنا الان"),
            const Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 54),
              child: ElevatedButton(
                  onPressed: () {
                    context.push("/products");
                  },
                  child: const Text("منتجاتنا")),
            ),
          ],
        ),
      ),
    );
  }
}
