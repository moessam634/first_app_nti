import 'package:flutter/material.dart';

AppBar customAppBar({
  required String title,
  required TextStyle? style,
  required Color? backgroundColor,
}) {
  return AppBar(
    title: Text(
      title,
      style: style,
    ),
    centerTitle: true,
    backgroundColor: backgroundColor,
  );
}
