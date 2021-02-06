import 'package:flutter/material.dart';
import 'package:sustainable_tracker/model/increaseSustainability.dart';
import 'package:sustainable_tracker/screens/home.dart';
import 'package:sustainable_tracker/screens/learn.dart';
import 'package:sustainable_tracker/screens/sustain.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _index = 0;
  List screenList;
  HomeScreen homeScreen;
  LearnScreen learnScreen;
  SustainScreen sustainScreen;
  var homeScreenKey = PageStorageKey("1");
  var learnScreenKey = PageStorageKey("2");


  @override
  void initState() {
    super.initState();
    getSustainItems();
    sustainScreen = SustainScreen();
    homeScreen = HomeScreen(key: homeScreenKey,);
    learnScreen = LearnScreen(key: learnScreenKey);
    screenList = [homeScreen, sustainScreen, learnScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screenList[_index],
      bottomNavigationBar: bottomNavBar(),
    );
  }
//4898e7
  Widget bottomNavBar() {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: _index,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xff328de6),
      backgroundColor: Colors.white.withOpacity(0.85),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.nature_people), label: "Sürdür"),
        BottomNavigationBarItem(icon: Icon(Icons.not_listed_location_rounded), label: "Öğren"),
      ],
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
    );
  }
}
