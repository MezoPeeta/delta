import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../app.dart';
import '../../../shared/hyperlink_widget.dart';
import '../../../styles/colors.dart';
import '../../../styles/icons.dart';
import 'login_providers.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  bool saveLogin = false;
  bool isPassHidden = true;
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/img/brand.png")),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text.rich(
                          TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 32),
                              children: [
                                const TextSpan(text: "تسجيل"),
                                const WidgetSpan(
                                    child: SizedBox(
                                  width: 4,
                                )),
                                TextSpan(
                                    text: "الدخول",
                                    style: TextStyle(
                                        color: AppColors.buttonColor)),
                              ]),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "قم بادخال رقم هاتفك و كلمة المرور لتسجيل دخولك",
                          style: TextStyle(color: AppColors.grayColor),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "رقم الهاتف",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            IntlPhoneField(
                              initialCountryCode: 'QA',
                              languageCode: "ar",
                              searchText: "ابحث عن الدولة/المنطقة",
                              showDropdownIcon: false,
                              invalidNumberMessage:
                                  "الرجاء التاكد من الرقم الهاتف",
                              onChanged: (v) {
                                if (v.isValidNumber()) {
                                  if (v.countryISOCode == "EG" &&
                                      RegExp("^0").hasMatch(v.number)) {
                                    setState(() {
                                      phoneNumber =
                                          "${v.countryCode.substring(1)}${v.number.substring(1)}";
                                    });
                                  } else {
                                    setState(() {
                                      phoneNumber =
                                          "${v.countryCode.substring(1)}${v.number}";
                                    });
                                  }
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value!.completeNumber.isEmpty ||
                                    phoneNumber.isEmpty) {
                                  return "ارجو ادخال رقم الهاتف الخاص بك";
                                }
                                return null;
                              },
                              flagsButtonPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("كلمة المرور"),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: isPassHidden,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ارجو ادخال لكمة المرور الخاص بك";
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
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: HyperLinkWidget(
                            text: "نسيت كلمة المرور",
                            onTap: () => context.push("/reset_pass"),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("ليس لديك حساب ؟"),
                                const SizedBox(
                                  width: 4,
                                ),
                                HyperLinkWidget(
                                  text: "انشاء حساب",
                                  onTap: () => context.push("/signup"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity, minHeight: 54),
                              child: Consumer(builder: (context, ref, child) {
                                return ElevatedButton(
                                    onPressed: () async {
                                      if (phoneNumber.isEmpty) {
                                        snackbarKey.currentState!.showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    "ارجو اكمال البيانات")));
                                      }
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });

                                        await ref.read(loginProvider(
                                                phone: phoneNumber,
                                                password:
                                                    passwordController.text)
                                            .future);

                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    },
                                    child: loading
                                        ? const CircularProgressIndicator
                                            .adaptive(
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.white))
                                        : const Text("تسجيل الدخول"));
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      }),
    );
  }
}
