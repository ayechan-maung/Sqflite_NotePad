import 'package:flutter/material.dart';

class BaseTheme {
  ThemeData buildTheme() {
    return ThemeData(
      // Define the default brightness and colors.
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0.0, titleTextStyle: TextStyle(color: Color(0xff595959)),
        // toolbarTextStyle: TextStyle(color: Color(0xff595959)),
        iconTheme: IconThemeData(color: Color(0xff595959)),
        actionsIconTheme: IconThemeData(color: Color(0xff595959)),
      ),
      // brightness: Brightness.dark,
      primaryColor: Color(0xff595959),
      scaffoldBackgroundColor: Color(0xffbdbbb6),

      // Define the default font family.
      fontFamily: 'Georgia',
      // inputDecorationTheme: InputDecorationTheme(focusColor: Colors.white),
      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal, buttonColor: Colors.white),
      textTheme: const TextTheme(
        // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
      ),
    );
  }
}
