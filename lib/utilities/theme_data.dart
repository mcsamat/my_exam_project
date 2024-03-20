import 'package:flutter/material.dart';

Color primaryColorDark = const Color.fromARGB(255, 162, 141, 79);
Color secondaryColorDark = const Color.fromARGB(255, 79, 100, 162);

Color primaryColorLight = Colors.indigoAccent;
Color secondaryColorLight = const Color.fromARGB(255, 218, 210, 185);

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: primaryColorLight,
    fontFamily: 'Poppins',
    primaryColorLight: primaryColorLight,
    
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: primaryColorLight,
    fontFamily: 'Poppins',
  );


}
