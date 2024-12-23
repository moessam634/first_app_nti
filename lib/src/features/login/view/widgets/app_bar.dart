import 'package:flutter/material.dart';
import 'package:login_app/src/core/styles/color_app.dart';
import 'package:login_app/src/core/styles/text_style_app.dart';
import '../../../../core/styles/string_app.dart';

AppBar loginAppBar() {
  return AppBar(
    backgroundColor: ColorApp.kTealColor,
    elevation: 0.0,
    title: Text(
      StringApp.login,
      style: TextStyleApp.normalWhite,
    ),
    centerTitle: true,
  );
}
