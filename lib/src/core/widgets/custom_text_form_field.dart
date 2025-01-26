import 'package:flutter/material.dart';
import 'package:login_app/src/core/model/text_form_field_model.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import 'package:login_app/src/core/widgets/text_form_field_border.dart';


class CustomTextFormField extends StatelessWidget {

   const CustomTextFormField({
    super.key, required this.textFormFieldModel,
  });

   final TextFormFieldModel textFormFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormFieldModel.controller,
      validator: textFormFieldModel.validator,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        label: Text(textFormFieldModel.label),
        hintText: textFormFieldModel.hintText,
        labelStyle: TextStyleApp.normalGrey,
        floatingLabelStyle: TextStyleApp.normalGrey,
        prefixIcon: Icon(textFormFieldModel.prefixIcon),
        suffixIcon: textFormFieldModel.suffixIcon,
        suffix: textFormFieldModel.suffix,
        border: textFormFieldBorder(radius: 16, color: ColorApp.kGreyColor),
        enabledBorder: textFormFieldBorder(
          radius: 16,
          color: ColorApp.kGreyColor,
        ),
        focusedBorder:
            textFormFieldBorder(radius: 16, color: ColorApp.kPrimaryColor),
      ),
      keyboardType: textFormFieldModel.keyBoardType,
      obscureText: textFormFieldModel.obscureText,
    );
  }
}
