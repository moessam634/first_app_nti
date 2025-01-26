import 'package:flutter/material.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/string_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import 'package:login_app/src/core/widgets/custom_app_bar.dart';
import '../../model/home_model.dart';
import '../home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? _result;
  String _classification = "";
  final formKey = GlobalKey<FormState>();

  void calculateBMI() {
    double height = double.parse(HomeController.heightController.text) / 100;
    double weight = double.parse(HomeController.weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    _classification = bmiClassification(_result!);
    setState(() {});
  }

  String bmiClassification(double result) {
    if (result < 18.5) {
      return "نحيف";
    } else if (result >= 18.5 && result < 24.9) {
      return "متوازن";
    } else if (result >= 25 && result < 29.9) {
      return "سمين";
    }
    return "سمين جدا";
  }

  @override
  void initState() {
    HomeController.weightController.addListener(
      () {
        setState(() {});
      },
    );
    HomeController.heightController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    HomeController.weightController.dispose();
    HomeController.heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: customAppBar(
          title: StringApp.bmiCalc,
          style: TextStyleApp.normalWhite,
          backgroundColor: ColorApp.kTealColor),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: homeList.length,
                  itemBuilder: (context, index) {
                    return homeList[index];
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        calculateBMI();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.kTealColor),
                    child: Text(
                      StringApp.result,
                      style: TextStyleApp.white18,
                    )),
                if (_result != null)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "${_result!.round()} : ",
                      style: TextStyleApp.normalTeal,
                    ),
                    Text(
                      _classification,
                      style: TextStyleApp.teal18,
                    ),
                  ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
