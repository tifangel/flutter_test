import 'package:flutter/material.dart';

import 'utility/constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: accentColor,
    scaffoldBackgroundColor: bgColor,
    fontFamily: "SF Pro Text",
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
