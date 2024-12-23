import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import 'package:login_app/src/core/widgets/custom_text_form_field.dart';
import 'package:login_app/src/features/register/view/widgets/register_app_bar.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _tokenController.dispose();
    _idController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: registerAppBar(context: context,title: StringApp.register,),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CustomTextFormField(
                    controller: _nameController,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CustomTextFormField(
                    controller: _idController,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CustomTextFormField(
                    controller: _phoneController,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CustomTextFormField(
                    controller: _emailController,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CustomTextFormField(
                    controller: _passwordController,
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
                    suffixIcon: obscureText
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_fill,
                    obscureText: obscureText,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    keyBoardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: CustomTextFormField(
                    controller: _tokenController,
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
                  ),
                ),
                CustomMaterialButton(
                  text: StringApp.register,
                  textStyle: TextStyleApp.white18,
                  color: ColorApp.kTealColor,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      customSnackBar(
                          context: context, text: StringApp.registerSuccessful);
                    }
                    customSnackBar(
                        context: context, text: StringApp.registerFailed);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
