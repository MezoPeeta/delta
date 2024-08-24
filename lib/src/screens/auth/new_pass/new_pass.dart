import 'package:delta/src/screens/auth/new_pass/providers/new_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/app_sheet.dart';
import '../../../styles/colors.dart';
import '../../../styles/icons.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({super.key, required this.email});
  final String email;

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  bool isPassHidden = true;
  bool isConfirmPassHidden = true;

  bool hasNumPassword = false;
  bool hasCapitalPassword = false;
  bool isValidLength = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool loading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(builder: (context, constraints) {
          return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: formKey,
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "انشاء كلمة المرور",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "كلمة المرور الجديدة",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: isPassHidden,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ارجو ادخال كلمة المرور الخاص بك";
                                }
                                if (value.length < 8) {
                                  return "يجب ان تكون كلمة المرور لا تقل عن 8 حروف";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "قم بأدخل كلمة المرور الخاصه بك",
                                prefixIcon: Container(
                                  width: 18,
                                  height: 18,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AppAssets.lockPath,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPassHidden = !isPassHidden;
                                    });
                                  },
                                  icon: Icon(
                                    isPassHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "تأكيد كلمة المرور الجديدة",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: passwordConfirmController,
                              obscureText: isConfirmPassHidden,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ارجو ادخال كلمة المرور الخاص بك";
                                }

                                if (value != passwordController.text) {
                                  return "يجب ان تتشابه الكلمتين";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "قم بتاكيد كلمة المرور الخاصه بك",
                                prefixIcon: Container(
                                  width: 18,
                                  height: 18,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AppAssets.lockPath,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isConfirmPassHidden =
                                          !isConfirmPassHidden;
                                    });
                                  },
                                  icon: Icon(
                                    isConfirmPassHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Consumer(builder: (context, ref, child) {
                          return ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 54),
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    await ref
                                        .read(setPasswordProvider(
                                                email: widget.email,
                                                password:
                                                    passwordController.text,
                                                confirmPassword:
                                                    passwordConfirmController
                                                        .text)
                                            .future)
                                        .then((status) {
                                      if (!context.mounted) return;
                                      appBottomSheet(context,
                                          actionButtons: [
                                            Expanded(
                                              child: ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                        minHeight: 54),
                                                child: ElevatedButton(
                                                    onPressed: () =>
                                                        context.push("/"),
                                                    child: const Text(
                                                      "هيا بنا",
                                                    )),
                                              ),
                                            ),
                                          ],
                                          header: "انشاء حساب",
                                          endHeader:
                                              "شكرا لانضمامك الي تطبيق الدلتا يمكنك الان التمتع بجميع خدمات التطبيق",
                                          subHeader: "تم تفعيل حسابك",
                                          isWarning: false,
                                          isDanger: false,
                                          coloredText: TextSpan(
                                            text: "بنجاح",
                                            style: TextStyle(
                                                color: AppColors.doneColor),
                                          ));
                                    });
                                    setState(() {
                                      loading = false;
                                    });
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
