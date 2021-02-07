import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sustainable_tracker/pages/homePage.dart';
import 'package:sustainable_tracker/pages/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sürdür',
      theme: ThemeData(
        primaryColor: Color(0xff4898e7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.raleway().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
