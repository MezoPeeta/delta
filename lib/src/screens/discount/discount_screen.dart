import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../styles/icons.dart';
import '../auth/widgets/text_form.dart';
import '../repair/repair_screen.dart';

class DiscountScreen extends ConsumerWidget {
  DiscountScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStorageProvider).requireValue;
    final nameController = TextEditingController(text: user!.name);
    final phoneController = TextEditingController(text: user.phone);

    return Scaffold(
      appBar: const CustomAppBar(title: "طلب عرض"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "طلباتك",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.add), Text("اضافة منتج")],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "العنوان",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              AddContainer(
                address: ref.watch(choosenAddressProvider),
              ),
              const SizedBox(
                height: 16,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 54),
                child: OutlinedButton(
                    onPressed: () {
                      context.push("/addresses");
                    },
                    child: const Text("اختيار عنوان اخر")),
              ),
              const SizedBox(
                height: 16,
              ),
              TextForm(
                  controller: nameController,
                  labelName: "اسمك",
                  hintText: "قم بأدخال أسمك الشخصي",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ارجو ادخال اسم الخاص بيك";
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.person_outline)),
              const SizedBox(
                height: 16,
              ),
              TextForm(
                  controller: phoneController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "برجاء ادخال رقم الهاتف الخاص بك";
                    }
                    return null;
                  },
                  labelName: "رقم الهاتف",
                  hintText: "قم بأدخال البريد الخاصه بك",
                  prefixIcon: const Icon(Icons.phone_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
