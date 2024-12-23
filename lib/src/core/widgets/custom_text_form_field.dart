import 'package:flutter/material.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import 'package:login_app/src/core/widgets/text_field_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.keyBoardType,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.onPressed,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        labelStyle: TextStyleApp.normalGrey,
        floatingLabelStyle: TextStyleApp.normalGrey,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(suffixIcon),
        ),
        border: textFormFieldBorder(radius: 16, color: ColorApp.kGreyColor),
        enabledBorder: textFormFieldBorder(
          radius: 16,
          color: ColorApp.kGreyColor,
        ),
        focusedBorder:
            textFormFieldBorder(radius: 16, color: ColorApp.kPrimaryColor),
      ),
      keyboardType: keyBoardType,
      obscureText: obscureText,
    );
  }
}
