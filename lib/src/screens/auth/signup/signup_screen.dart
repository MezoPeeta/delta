import 'package:delta/src/screens/auth/signup/domain/signup_domain.dart';
import 'package:delta/src/screens/auth/widgets/text_form.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:delta/src/styles/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../app.dart';
import '../../../shared/hyperlink_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String phoneNumber = "";
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

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
                                const TextSpan(text: "انشاء"),
                                const WidgetSpan(
                                    child: SizedBox(
                                  width: 4,
                                )),
                                TextSpan(
                                    text: "حساب",
                                    style: TextStyle(
                                        color: AppColors.buttonColor)),
                              ]),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "سعداء بانضمامك معنا ونتمنى لك تجربة مميزة",
                          style: TextStyle(color: AppColors.grayColor),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextForm(
                          controller: nameController,
                          labelName: "الاسم",
                          hintText: "قم بأدخال أسمك الشخصي",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ارجو ادخال اسم الخاص بيك";
                            }
                            return null;
                          },
                          prefixIcon: Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AppAssets.lockPath,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
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
                        const SizedBox(
                          height: 16,
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
                            IntlPhoneField(
                              initialCountryCode: 'QA',
                              showDropdownIcon: false,
                              searchText: "ابحث عن الدولة/المنطقة",
                              invalidNumberMessage:
                                  "الرجاء التاكد من الرقم الهاتف",
                              languageCode: "ar",
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
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("لدي حساب بالفعل ؟"),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  HyperLinkWidget(
                                    text: "تسجيل الدخول",
                                    onTap: () => context.push("/signin"),
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
                                          snackbarKey.currentState!
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "ارجو اكمال البيانات")));
                                        }

                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;
                                          });

                                          await ref.read(signUpProvider(
                                                  userName: nameController.text,
                                                  email: emailController.text,
                                                  phone: phoneNumber)
                                              .future);
                                        }
                                        setState(() {
                                          loading = false;
                                        });
                                      },
                                      child: loading
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.white),
                                            )
                                          : const Text("انشاء الحساب"));
                                }),
                              ),
                            ],
                          ),
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
