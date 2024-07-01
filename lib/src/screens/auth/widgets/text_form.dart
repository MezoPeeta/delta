import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.labelName,
    required this.hintText,
    this.isPassword = false,
    this.isTextArea = false,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.validator,
    this.onTap,
    this.keyboardType,
    this.readOnly = false,
  });
  final String labelName, hintText;
  final bool isPassword, isTextArea;
  final Widget? prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          readOnly: readOnly,
          maxLines: isTextArea ? 5 : null,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onTap: onTap,
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: isTextArea
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: prefixIcon,
                    )
                  : prefixIcon,
              suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}
