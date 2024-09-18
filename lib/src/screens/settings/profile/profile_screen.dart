import 'package:delta/src/screens/auth/login/data/user.dart';
import 'package:delta/src/screens/products/product_detail.dart';
import 'package:delta/src/screens/settings/notifications/notifications_screen.dart';
import 'package:delta/src/screens/settings/profile/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/widgets/text_form.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key, required this.user});
  final User user;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController(text: user.name);
    final phoneController = TextEditingController(text: user.phone);
    final newPhoneController = TextEditingController(text: user.anotherPhone);
    final isGuest = user.name == "زائر";
    final loading = ref.watch(loadingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("الملف الشخصي"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: isGuest
            ? const LoginRequiredWidget()
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.sizeOf(context).height),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          TextForm(
                              labelName: "اسمك",
                              controller: nameController,
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return "برجاء ادخال الاسم الخاص بك";
                                }
                                return null;
                              },
                              hintText: "قم بأدخال الاسم الخاص بك",
                              prefixIcon: const Icon(Icons.person_outlined)),
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
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    ref.read(loadingProvider.notifier).state =
                                        true;
                                    await ref.read(updateUserProvider(
                                            userName: nameController.text,
                                            phone: phoneController.text,
                                            newPhone: newPhoneController.text)
                                        .future);
                                    ref.read(loadingProvider.notifier).state =
                                        false;
                                  }
                                },
                                child: loading
                                    ? const CircularProgressIndicator.adaptive(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : const Text("حفظ")),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 54),
                            child: OutlinedButton(
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)))),
                                onPressed: () {
                                  context.push("/addresses");
                                },
                                child: const Text("العناوين")),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
