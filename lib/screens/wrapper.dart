import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustainable_tracker/model/user.dart';
import 'package:sustainable_tracker/pages/homePage.dart';
import 'package:sustainable_tracker/pages/onBoarding.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return OnBoarding();
    } else {
      return HomePage();
    }
  }
}