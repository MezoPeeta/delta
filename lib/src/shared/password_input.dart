import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/icons.dart';

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  PasswordInput(
      {super.key,
      required this.passwordController,
      this.state = true,
      required this.label,
      this.hintText = "قم بأدخل كلمة المرور الخاصه بك",
      this.validator});

  final TextEditingController passwordController;
  bool state;
  final String label;
  String hintText;
  final String? Function(String?)? validator;
  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.passwordController,
          obscureText: widget.state,
          validator: widget.validator ??
              (value) {
                if (value!.isEmpty) {
                  return "ارجو ادخال كلمة المرور الخاص بك";
                }
                return null;
              },
          decoration: InputDecoration(
            hintText: widget.hintText,
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
                  widget.state = !widget.state;
                });
              },
              icon: Icon(
                widget.state ? Icons.visibility_off : Icons.visibility,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
