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

  bool hasNumPassword = false;
  bool hasCapitalPassword = false;
  bool isValidLength = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool isValidPassword(String password) {
    RegExp numberRegExp = RegExp(r'\d');
    RegExp capitalLetterRegExp = RegExp(r'[A-Z]');

    bool hasNumber = numberRegExp.hasMatch(password);
    bool hasCapitalLetter = capitalLetterRegExp.hasMatch(password);
    bool hasValidLength = password.length >= 8 && password.length >= 10;

    setState(() {
      hasNumPassword = hasNumber;
      hasCapitalPassword = hasCapitalLetter;
      isValidLength = hasValidLength;
    });

    return hasNumber && hasCapitalLetter && hasValidLength;
  }

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
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PasswordInput(
                          label: "تاكيد كلمة المرور الجديدة",
                          passwordController: passwordConfirmController,
                          hintText: "قم بتاكيد كلمة المرور الخاصه بك",
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Checkbox.adaptive(
                                value: isValidLength,
                                onChanged: (v) {},
                                activeColor: Colors.transparent,
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      width: 1.0, color: AppColors.grayColor),
                                ),
                                checkColor: AppColors.grayColor),
                            Text(
                              "10-8 احرف علي الاقل",
                              style: TextStyle(color: AppColors.grayColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox.adaptive(
                                value: hasNumPassword,
                                onChanged: (v) {},
                                activeColor: Colors.transparent,
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      width: 1.0, color: AppColors.errorColor),
                                ),
                                checkColor: AppColors.errorColor),
                            Text(
                              "رقم واحد علي الاقل",
                              style: TextStyle(
                                  color: hasNumPassword
                                      ? AppColors.errorColor
                                      : AppColors.grayColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox.adaptive(
                                value: hasCapitalPassword,
                                onChanged: (v) {},
                                activeColor: Colors.transparent,
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      width: 1.0, color: AppColors.doneColor),
                                ),
                                checkColor: AppColors.doneColor),
                            Text(
                              "حرف كبير واحد على الأقل",
                              style: TextStyle(
                                  color: hasCapitalPassword
                                      ? AppColors.doneColor
                                      : AppColors.grayColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox.adaptive(
                                value: passwordConfirmController.text ==
                                        passwordController.text &&
                                    passwordController.text.isNotEmpty,
                                onChanged: (v) {},
                                activeColor: Colors.transparent,
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      width: 1.0, color: AppColors.doneColor),
                                ),
                                checkColor: AppColors.doneColor),
                            Text(
                              "كلماتين المرور متشابهة",
                              style: TextStyle(
                                  color: passwordConfirmController.text ==
                                              passwordController.text &&
                                          passwordController.text.isNotEmpty
                                      ? AppColors.doneColor
                                      : AppColors.grayColor),
                            ),
                          ],
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
                                    ref.read(resetPasswordProvider(
                                        email: widget.email,
                                        password: passwordController.text,
                                        confirmPassword:
                                            passwordConfirmController.text));
                                    setState(() {
                                      loading = false;
                                    });
                                    if (!mounted) return;
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
                                    ? const CircularProgressIndicator.adaptive()
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
