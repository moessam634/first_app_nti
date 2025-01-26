import 'package:flutter/material.dart';
class TextFormFieldModel {
  const TextFormFieldModel({
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.keyBoardType,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.onPressed,
    this.suffix,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
}