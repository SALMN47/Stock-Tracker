import 'package:flutter/material.dart';

class Appsizes {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
}

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.light(
          primary: Colors.blueAccent,
          onPrimary: Colors.blue,
          secondary: Colors.white,
          surface: Color(0xFF898989),
          tertiary: Color(0xFFFFFFFF),
          //  background: Color(0xFF5CC28F),
        ),
        textTheme: TextTheme(
          titleSmall: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width * 0.03,
            //12
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width * 0.047,
            //18
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width * 0.068,
            //24
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width * 0.03,
            //12
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width * 0.047,
            //18
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            fontSize: MediaQuery.sizeOf(context).width * 0.068,
            //24
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
