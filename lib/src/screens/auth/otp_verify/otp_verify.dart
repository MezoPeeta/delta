import 'dart:async';

import 'package:delta/src/app.dart';
import 'package:delta/src/screens/auth/otp_verify/providers/otp_providers.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  int number = 60;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (number == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            number--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  bool loading = false;
  String otpValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Center(
          child: Column(
            children: [
              const Text(
                "رمز التحقق",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "تم ارسال رمز التحقق علي بريدك الالكتروني  ",
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.email),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_outlined,
                        color: AppColors.buttonColor,
                      ))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: OTPTextField(
                  length: 4,
                  onCompleted: (value) {
                    setState(() {
                      otpValue = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 17),
                  fieldStyle: FieldStyle.box,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("ستنتهي صلاحية الكود خلال"),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "($number ثانية)",
                    style: TextStyle(
                        color: number == 0
                            ? AppColors.grayColor
                            : AppColors.linkColor),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Consumer(builder: (context, ref, child) {
                    return GestureDetector(
                      onTap: () {
                        if (number == 0) {
                          ref.read(sendOTPProvider(email: widget.email));
                          snackbarKey.currentState!.showSnackBar(const SnackBar(
                              content:
                                  Text("تم ارسال الرمز الي البريد الاكتروني")));
                          setState(() {
                            number = 60;
                          });
                          startTimer();
                          return;
                        }
                        return;
                      },
                      child: Text(
                        "اعادة ارسال",
                        style: TextStyle(
                            color: number == 0
                                ? AppColors.linkColor
                                : AppColors.grayColor,
                            decoration: TextDecoration.underline,
                            decorationColor: number == 0
                                ? AppColors.linkColor
                                : AppColors.grayColor),
                      ),
                    );
                  })
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Consumer(builder: (context, ref, child) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 54),
                  child: ElevatedButton(
                      onPressed: () async {
                        // print(otpValue);
                        setState(() {
                          loading = true;
                        });
                        ref.read(verifyOTPProvider(
                            email: widget.email, otp: otpValue));
                        setState(() {
                          loading = false;
                        });
                        bool isResetPassword =
                            ref.watch(isResetPasswordProvider);
                        if (isResetPassword) {
                          context.push("/pass_confirm", extra: widget.email);

                          return;
                        }

                        context.push("/new_pass", extra: widget.email);
                      },
                      child: loading
                          ? const CircularProgressIndicator.adaptive()
                          : const Text("تاكيد")),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
