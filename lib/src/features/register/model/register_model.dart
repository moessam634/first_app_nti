import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/core/widgets/custom_text_form_field.dart';
import '../../../core/model/text_form_field_model.dart';
import '../../../core/styles/string_app.dart';
import '../register_controller.dart';

class RegisterPasswordField extends StatefulWidget {
  const RegisterPasswordField({super.key});

  @override
  State<RegisterPasswordField> createState() => _RegisterPasswordFieldState();
}

class _RegisterPasswordFieldState extends State<RegisterPasswordField> {
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
        controller: RegisterController.passwordController,
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

List<Widget> registerFields = [
  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
    controller: RegisterController.nameController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return StringApp.pleaseEnterYourName;
      }
      if (value.length < 3) {
        return StringApp.nameCharactersLong;
      }
      return null;
    },
    label: StringApp.name,
    hintText: StringApp.enterName,
    prefixIcon: Icons.person,
    keyBoardType: TextInputType.name,
  )),
  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
    controller: RegisterController.idController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return StringApp.pleaseEnterYourId;
      }
      if (value.length < 14) {
        return StringApp.idNumberLong;
      }
      return null;
    },
    label: StringApp.id,
    hintText: StringApp.enterYourId,
    prefixIcon: Icons.credit_card_rounded,
    keyBoardType: TextInputType.number,
  )),
  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
    controller: RegisterController.phoneController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return StringApp.pleaseEnterYourNumber;
      }
      if (value.length < 11) {
        return StringApp.phoneNumberLong;
      }
      return null;
    },
    label: StringApp.phoneNumber,
    hintText: StringApp.enterPhoneNumber,
    prefixIcon: Icons.phone_android_rounded,
    keyBoardType: TextInputType.number,
  )),
  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
    controller: RegisterController.emailController,
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
 const RegisterPasswordField(),
  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
    controller: RegisterController.tokenController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return StringApp.pleaseEnterYourToken;
      }
      if (value.length < 5) {
        return StringApp.tokenCharactersLong;
      }
      return null;
    },
    label: StringApp.token,
    hintText: StringApp.enterToken,
    prefixIcon: Icons.token_rounded,
    keyBoardType: TextInputType.text,
  )),
];
