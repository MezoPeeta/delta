import 'package:delta/src/screens/settings/change_pass/providers/change_pass_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/password_input.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isCurrentPassHidden = true;
  bool isNewPassHidden = true;
  bool isConfirmpassHidden = true;
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تغير كلمة المرور"),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      PasswordInput(
                        label: "كلمة المرور الحالية",
                        passwordController: currentPasswordController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordInput(
                        label: "كلمة المرور الجديدة",
                        hintText: "قم بادخال كلمة المرور الخاصه بك",
                        passwordController: newPasswordController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordInput(
                        label: "تاكيد كلمة المرور الجديدة",
                        hintText: "قم بتاكيد كلمة المرور الخاصه بك",
                        passwordController: confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "ارجو كتابة كلمة المرور";
                          }
                          if (value != newPasswordController.text) {
                            return "كلمة المرور مختلفة عن التاكيد";
                          }
                          return null;
                        },
                      ),
                      const Spacer(),
                      Consumer(builder: (context, ref, child) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, minHeight: 54),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  ref.read(changePasswordProvider(
                                      currentPassword:
                                          currentPasswordController.text,
                                      newPassword: newPasswordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text));
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              },
                              child: loading
                                  ? const CircularProgressIndicator.adaptive()
                                  : const Text("حفظ")),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
