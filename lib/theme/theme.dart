import 'package:flutter/material.dart';

// pub dev
import 'package:hexcolor/hexcolor.dart';

String hexColor = "05C0C7";

final themeData = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: HexColor("#$hexColor"),
        onPrimary: HexColor("#$hexColor"),
        secondary: HexColor("#$hexColor"),
        onSecondary: HexColor("#$hexColor"),
        error: Colors.lightBlue,
        onError: Colors.lightBlue,
        background: HexColor("#$hexColor"),
        onBackground: HexColor("#$hexColor"),
        surface: HexColor("#$hexColor"),
        onSurface: HexColor("#$hexColor")));

//05C0C7