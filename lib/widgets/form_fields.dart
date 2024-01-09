import 'package:flutter/material.dart';

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
        color: Color.fromRGBO(89, 175, 109, 1),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color.fromRGBO(89, 175, 109, 1),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        suffix: suffix,
        prefixIcon: Icon(
          prefixIcon,
          color: Color.fromRGBO(89, 175, 109, 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: Color.fromRGBO(89, 175, 109, 1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: Color.fromRGBO(89, 175, 109, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: Color.fromRGBO(89, 175, 109, 1),
          ),
        ),
      ),
    );
  }
}
