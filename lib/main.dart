import 'package:flutter/material.dart';
import 'package:note_pad/pages/home.dart';
import 'package:note_pad/pages/widget/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Pad',
      debugShowCheckedModeBanner: false,
      theme: BaseTheme().buildTheme(),
      home: HomePage(),
    );
  }
}
