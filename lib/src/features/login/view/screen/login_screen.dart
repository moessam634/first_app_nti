import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import 'package:login_app/src/core/widgets/custom_text_form_field.dart';
import 'package:login_app/src/features/register/view/screen/register_screen.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../widgets/app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: loginAppBar(),
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
                CustomMaterialButton(
                  text: StringApp.login,
                  textStyle: TextStyleApp.white18,
                  color: ColorApp.kTealColor,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      customSnackBar(
                          context: context, text: StringApp.loginSuccessful);
                    }
                    customSnackBar(
                        context: context, text: StringApp.loginFailed);
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
                  },
                  child: Text(StringApp.doNotHaveAcc),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
