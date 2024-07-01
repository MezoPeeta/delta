import 'package:delta/src/screens/auth/otp_verify/providers/otp_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/colors.dart';
import '../widgets/text_form.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailController = TextEditingController();

  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            children: [
              const Text(
                "نسيت كلمة المرور",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "بالرجاء إدخال بريدك الإلكتروني لإرسال رمز التأكيد اليه "),
              const SizedBox(
                height: 32,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextForm(
                          controller: emailController,
                          labelName: "البريد الاكتروني",
                          hintText: "قم بأدخال البريد الخاصه بك",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ارجو ادخال البريد الاكتروني الخاص بك";
                            }
                            if (!emailValid.hasMatch(value)) {
                              return "الرجاء التاكد من البريد الاكتروني الخاص بك";
                            }

                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.grayColor,
                          )),
                    ],
                  )),
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
                          ref.read(
                              sendOTPProvider(email: emailController.text));
                          setState(() {
                            loading = false;
                          });
                          ref.read(isResetPasswordProvider.notifier).state =
                              true;
                          context.push("/otp_verify",
                              extra: emailController.text);
                        }
                      },
                      child: loading
                          ? const CircularProgressIndicator.adaptive()
                          : const Text("ارسال الرمز")),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
