import 'package:delta/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../auth/widgets/text_form.dart';
import 'providers/feedback_providers.dart';

class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});

  @override
  ConsumerState<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends ConsumerState<FeedbackScreen> {
  final nameController = TextEditingController();

  final messageController = TextEditingController();
  String phoneNumber = "";
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("شكاوي و اقتراحات"),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextForm(
                          controller: nameController,
                          labelName: "اسمك",
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "ارجو بكتابة الاسم";
                            }
                            return null;
                          },
                          hintText: "قم بأدخل اسمك الشخصي",
                          prefixIcon:
                              const Icon(Icons.person_outline_outlined)),
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
                            languageCode: "ar",
                              searchText: "ابحث عن الدولة",

                            onChanged: (v) {
                              setState(() {
                                phoneNumber = v.completeNumber;
                              });
                            },
                            flagsButtonPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextForm(
                          controller: messageController,
                          isTextArea: true,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "ارجو بكتابة الشكوي";
                            }
                            return null;
                          },
                          labelName: "رسالتك",
                          hintText: "قم بأدخل رسالتك هنا",
                          prefixIcon: const Icon(Icons.email_outlined)),
                      const Spacer(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            minWidth: double.infinity, minHeight: 54),
                        child: ElevatedButton(
                            onPressed: () {
                              if (phoneNumber.isEmpty) {
                                snackbarKey.currentState!.showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("ارجوا باستكمال البيانات")));
                                return;
                              }
                              if (_key.currentState!.validate()) {
                                ref.read(sendFeedbackProvider(
                                    userName: nameController.text,
                                    phone: phoneNumber,
                                    message: messageController.text));
                              }
                            },
                            child: const Text("ارسال")),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
