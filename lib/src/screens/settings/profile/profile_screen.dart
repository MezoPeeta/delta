import 'package:delta/src/screens/auth/login/data/user.dart';
import 'package:flutter/material.dart';

import '../../auth/widgets/text_form.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: user.name);
    final phoneController = TextEditingController(text: user.phone);
    final newPhoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("الملف الشخصي"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            TextForm(
                labelName: "اسمك",
                controller: nameController,
                hintText: "قم بأدخال الاسم الخاص بك",
                prefixIcon: const Icon(Icons.person_outlined)),
            const SizedBox(
              height: 16,
            ),
            TextForm(
                controller: phoneController,
                labelName: "رقم الهاتف",
                hintText: "قم بأدخال البريد الخاصه بك",
                prefixIcon: const Icon(Icons.phone_outlined)),
            const SizedBox(
              height: 16,
            ),
            TextForm(
                controller: newPhoneController,
                labelName: "رقم الهاتف اخر",
                hintText: "قم بادخال رقم هاتفك الاخر",
                prefixIcon: const Icon(Icons.phone_outlined)),
            const Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 54),
              child: ElevatedButton(onPressed: () {}, child: const Text("حفظ")),
            ),
            const SizedBox(
              height: 16,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 54),
              child: OutlinedButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {},
                  child: const Text("العناوين")),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
