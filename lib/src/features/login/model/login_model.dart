import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/core/model/text_form_field_model.dart';
import 'package:login_app/src/core/widgets/custom_text_form_field.dart';
import 'package:login_app/src/features/login/login_controller.dart';
import '../../../core/styles/string_app.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
        controller: LoginController.passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return StringApp.pleaseEnterYourPassword;
          }
          if (value.length < 8) {
            return StringApp.passwordCharactersLong;
          }
          return null;
        },
        label: StringApp.password,
        hintText: StringApp.enterPassword,
        prefixIcon: Icons.password_rounded,
        suffixIcon: IconButton(
            onPressed: () {
              obscureText = !obscureText;
              setState(() {});
            },
            icon: Icon(obscureText
                ? CupertinoIcons.eye_slash_fill
                : CupertinoIcons.eye_fill)),
        obscureText: obscureText,
        keyBoardType: TextInputType.visiblePassword,
      ),
    );
  }
}

List<Widget> loginList = [
   CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
    controller: LoginController.emailController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return StringApp.pleaseEnterYourEmail;
      }
      final emailRegEx = RegExp(r'@$');
      if (!emailRegEx.hasMatch(value)) {
        return StringApp.pleaseEnterAValidEmail;
      }
      return null;
    },
    label: StringApp.email,
    hintText: StringApp.enterEmail,
    prefixIcon: Icons.email,
    keyBoardType: TextInputType.emailAddress,
  )),
  const PasswordField(),
];

