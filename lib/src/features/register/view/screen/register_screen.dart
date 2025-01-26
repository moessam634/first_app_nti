import 'package:flutter/material.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import 'package:login_app/src/features/register/model/register_model.dart';
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
      appBar: registerAppBar(
        context: context,
        title: StringApp.register,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.separated(
                  padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return registerFields[index];
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 16,
                        ),
                    itemCount: registerFields.length),
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
          ],
        ),
      ),
    );
  }
}
