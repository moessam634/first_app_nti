import 'package:flutter/material.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import 'package:login_app/src/features/login/login_controller.dart';
import 'package:login_app/src/features/login/model/login_model.dart';
import '../../../../core/styles/string_app.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../bmi_calculator/view/screen/home_screen.dart';
import '../../../register/view/screen/register_screen.dart';
import '../widgets/app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    LoginController.emailController.addListener(
      () {
        setState(() {});
      },
    );
    LoginController.passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    LoginController.emailController.dispose();
    LoginController.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: loginAppBar(),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.separated(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return loginList[index];
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 16,
                    ),
                itemCount: loginList.length),
            CustomMaterialButton(
              text: StringApp.login,
              textStyle: TextStyleApp.white18,
              color: ColorApp.kTealColor,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  customSnackBar(
                      context: context, text: StringApp.loginSuccessful);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => false,
                  );
                }
                customSnackBar(context: context, text: StringApp.loginFailed);
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
              },
              child: Text(StringApp.doNotHaveAcc),
            ),
          ],
        ),
      ),
    );
  }
}
