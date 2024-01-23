import 'package:flutter/material.dart';
import 'package:seedswild/core/constants/colors.dart';

class SeedsTextFormField extends StatelessWidget {

  final Key? key;
  final String hintText;
  final IconData prefixIcon;
  final bool? obscureText;
  final GlobalKey<FormFieldState>? formFieldKey;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? suffix;

  SeedsTextFormField({
    this.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.formFieldKey = null,
    this.keyboardType = TextInputType.text,
    this.controller = null,
    this.focusNode = null,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      focusNode: focusNode,
      key: formFieldKey,
      style: TextStyle(
        color: SeedsColor.primary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: SeedsColor.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        suffix: suffix,
        prefixIcon: Icon(
          prefixIcon,
          color: SeedsColor.primary,
        ),
        // no border at all - no even a line - background color (grey)
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Color.fromRGBO(229, 229, 229, 1),
        filled: true,
      ),
    );
  }
}
