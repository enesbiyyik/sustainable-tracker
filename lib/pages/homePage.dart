import 'package:flutter/material.dart';
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
  var sustainScreenKey = PageStorageKey("3");


  @override
  void initState() {
    super.initState();
    homeScreen = HomeScreen(key: homeScreenKey,);
    learnScreen = LearnScreen(key: learnScreenKey);
    sustainScreen = SustainScreen(key: sustainScreenKey,);
    screenList = [homeScreen, sustainScreen, learnScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: screenList[_index],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: _index,
      showUnselectedLabels: false,
      backgroundColor: Colors.white.withOpacity(0.5),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      ],
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text("Sürdür", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
    );
  }
}
