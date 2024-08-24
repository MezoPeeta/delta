import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/app_sheet.dart';
import '../../../shared/password_input.dart';
import '../../../styles/colors.dart';
import '../reset_pass/providers/reset_pass_providers.dart';

class CompletePassScreen extends StatefulWidget {
  const CompletePassScreen({super.key, required this.email});
  final String email;
  @override
  State<CompletePassScreen> createState() => _CompletePassScreenState();
}

class _CompletePassScreenState extends State<CompletePassScreen> {
  bool isPassHidden = true;
  bool isConfirmPassHidden = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(builder: (context, constraints) {
          return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "انشاء كلمة المرور جديده",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "يرجي اضافة كلمة مرور قوية للحفاظ علي بياناتك",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        PasswordInput(
                          label: "كلمة المرور الجديدة",
                          passwordController: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ارجو ادخال كلمة المرور الخاص بك";
                            }
                            if (value.length < 8) {
                              return "يجب ان تكون كلمة المرور لا تقل عن 8 حروف";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PasswordInput(
                          label: "تاكيد كلمة المرور الجديدة",
                          passwordController: passwordConfirmController,
                          hintText: "قم بتاكيد كلمة المرور الخاصه بك",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ارجو ادخال كلمة المرور الخاص بك";
                            }

                            if (value != passwordController.text) {
                              return "يجب ان تتشابه الكلمتين";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Spacer(),
                        Consumer(builder: (context, ref, child) {
                          return ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 54),
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    await ref.read(resetPasswordProvider(
                                            email: widget.email,
                                            password: passwordController.text,
                                            confirmPassword:
                                                passwordConfirmController.text)
                                        .future);
                                    setState(() {
                                      loading = false;
                                    });
                                    if (!context.mounted) return;
                                    appBottomSheet(context,
                                        actionButtons: [
                                          Expanded(
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  minHeight: 54),
                                              child: ElevatedButton(
                                                  onPressed: () =>
                                                      context.push("/signin"),
                                                  child: const Text(
                                                    "تسجيل الدخول",
                                                  )),
                                            ),
                                          ),
                                        ],
                                        header: "نسيت كلمة المرور",
                                        endHeader:
                                            "حاول الاحتفاظ بكلمة المرور بعيدا لتفادي سرقه حسابك و بياناتك",
                                        subHeader: "تم تغير كلمة المرور",
                                        isWarning: false,
                                        isDanger: false,
                                        coloredText: TextSpan(
                                          text: "بنجاح",
                                          style: TextStyle(
                                              color: AppColors.doneColor),
                                        ));
                                  }
                                },
                                child: loading
                                    ? const CircularProgressIndicator.adaptive(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : const Text("تاكيد")),
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        )
                      ]),
                    ),
                  ),
                ),
              ));
        }));
  }
}
