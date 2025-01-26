import 'package:flutter/material.dart';
import 'package:login_app/src/core/widgets/custom_text_form_field.dart';
import '../../../core/model/text_form_field_model.dart';
import '../view/home_controller.dart';

List<Widget> homeList = [
  CustomTextFormField(
    textFormFieldModel: TextFormFieldModel(
      label: 'وزن الجسم',
      hintText: 'يرجى ادخال وزن الجسم',
      validator: (value) {
        if (value!.isEmpty || value.length <= 1) {
          return 'يرجى ادخال وزن الجسم صحيح';
        }
        return null;
      },
      prefixIcon: Icons.balance,
      suffixIcon: IconButton(
          onPressed: () {
            HomeController.weightController.clear();
          },
          icon: Icon(Icons.clear)),
      keyBoardType: TextInputType.number,
      controller: HomeController.weightController,
    ),
  ),
  CustomTextFormField(
      textFormFieldModel: TextFormFieldModel(
    label: 'طول الجسم',
    hintText: 'يرجى ادخال طول الجسم',
    validator: (value) {
      if (value!.isEmpty || value.length < 3) {
        return "يرجى ادخال طول الجسم صحيح";
      }
      return null;
    },
    prefixIcon: Icons.height_outlined,
    keyBoardType: TextInputType.number,
    controller: HomeController.heightController,
  )),
];
