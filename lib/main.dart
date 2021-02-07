import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sustainable_tracker/pages/homePage.dart';
import 'package:sustainable_tracker/pages/onBoarding.dart';
import 'package:sustainable_tracker/screens/wrapper.dart';
import 'package:sustainable_tracker/services/auth.dart';

import 'model/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Sürdür',
        theme: ThemeData(
          primaryColor: Color(0xff4898e7),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
