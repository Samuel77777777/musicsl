import 'package:flutter/material.dart';
import 'package:musicsl/colors/colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme:ColorScheme.light(
    background: Colors.grey.shade400,
  )


);


ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  // ignore: prefer_const_constructors
  colorScheme: ColorScheme.dark(
    background: backgroundColor,
    primary: textColor,
    secondary: whiteColor,


  )


);



