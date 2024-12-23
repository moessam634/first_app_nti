import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/color_app.dart';
import '../../../../core/styles/text_style_app.dart';

AppBar registerAppBar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: ColorApp.kTealColor,
    elevation: 0.0,
    title: Text(
      title,
      style: TextStyleApp.normalWhite,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        CupertinoIcons.back,
      ),
      color: ColorApp.kWhiteColor,
    ),
  );
}
