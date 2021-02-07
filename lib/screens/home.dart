import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double todaySliderValue = 15;
  double yesterdayScore = 20;
  double weeklyAverageScore = 50;

  bool usePlastic = false;

  Duration initialtimer = new Duration();
  int selectFood = 1;
  String screenTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgrndColor(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                appBar(),
                slider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        scores(),
                        todayDone(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Background Color
  Widget backgrndColor() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xff276375), const Color(0xff050D10)],
        ),
      ),
    );
  }

  //AppBar & Actions
  Widget appBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 25, //Left
        //MediaQuery.of(context).size.height / 10, //Top
        0,
        MediaQuery.of(context).size.width / 25, //Right
        MediaQuery.of(context).size.height / 50, //Botttom
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Hoş Geldiniz!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  height: 40,
                  minWidth: 40,
                  child: Icon(Icons.settings),
                  color: Colors.white,
                ),
                SizedBox(width: 15),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  height: 40,
                  minWidth: 40,
                  child: Icon(Icons.person),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Slider Bar & Score
  Widget slider() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 20, //Left
        MediaQuery.of(context).size.height / 20, //Top
        MediaQuery.of(context).size.width / 20, //Right
        MediaQuery.of(context).size.height / 100, //Botttom
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${todaySliderValue.round().toString()}",
                  style: TextStyle(fontSize: 40, color: Colors.white)),
              Text(" / 100",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              disabledActiveTrackColor: Colors.blue,
              disabledInactiveTrackColor: Colors.white,
              disabledThumbColor: Colors.blue,
              trackHeight: 20,
              thumbShape: RoundSliderThumbShape(
                disabledThumbRadius: 11,
                pressedElevation: 0,
                elevation: 0,
              ),
            ),
            child: Slider(
              value: todaySliderValue,
              onChanged: null,
              min: 0,
              max: 100,
              divisions: 100,
            ),
          ),
        ],
      ),
    );
  }

  //Previous Scores & Increasing Score
  Widget scores() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 7.5, //Left
        MediaQuery.of(context).size.height / 15, //Top
        MediaQuery.of(context).size.width / 7.5, //Right
        MediaQuery.of(context).size.height / 15, //Botttom
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Left Score
              Column(children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff4898E7), width: 5),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${yesterdayScore.round().toString()}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(" / 100",
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Dün Kazanılan\nPuanlar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ]),
              SizedBox(width: MediaQuery.of(context).size.width / 10),

              //Right Score
              Column(children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff4898E7), width: 5),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${weeklyAverageScore.round().toString()}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(" / 100",
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Haftanın\nOrtalaması",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ]),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),

          //Increasing Button
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            height: 50,
            color: Color(0xff328DE6),
            minWidth: double.maxFinite,
            child: Text(
              "Sürdürülebilirlik Puanını Arttır",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  //Today Done Box
  Widget todayDone() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 20, //Left
        MediaQuery.of(context).size.height / 100, //Top
        MediaQuery.of(context).size.width / 20, //Right
        MediaQuery.of(context).size.height / 50, //Botttom
      ),
      child: Container(
        height: 320,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              todayDoneTitle(),
              todayDoneContents(context),
            ],
          ),
        ),
      ),
    );
  }

  //Today Done Box-Title
  Widget todayDoneTitle() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bugün Yaptıkların",
              style: TextStyle(
                color: Color(0xff328DE6),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7.5),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width / 3,
              color: Color(0xffCCE3F9),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {},
            height: MediaQuery.of(context).size.height / 17.5,
            minWidth: MediaQuery.of(context).size.width / 17.5,
            color: Color(0xff328DE6),
            child: Icon(
              Icons.add,
              size: MediaQuery.of(context).size.height / 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  //Today Done Box-Content
  Widget todayDoneContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          todayDoneRow1(context),
          todayDoneRow2(context),
          todayDoneRow3(context),
        ],
      ),
    );
  }

  //Today Done Box-Contents FoodType
  Widget todayDoneRow1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.food_bank, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Yemek Türü",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            typePicker(context);
          },
          child: Text("Seç",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900)),
          height: 30,
          minWidth: 50,
          color: Color(0xff45D1FD),
        ),
      ),
    );
  }

  //Today Done Box-Contents ScreenTime
  Widget todayDoneRow2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.phone, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Ekran Süresi",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            timePicker(context);
          },
          child: Text("Seç",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              )),
          height: 30,
          minWidth: 50,
          color: Color(0xff45D1FD),
        ),
      ),
    );
  }

  //Today Done Box-Contents UsePlastic
  Widget todayDoneRow3(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(Icons.ac_unit, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text("Plastik Kullanımı",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        // SizedBox(width: MediaQuery.of(context).size.width / 12.5),
        trailing: Checkbox(
          value: usePlastic,
          onChanged: (change) {
            setState(() {
              usePlastic = change;
            });
          },
        ),
      ),
    );
  }

  Future typePicker(BuildContext context, {double height}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: height ?? MediaQuery.of(context).size.height / 3,
        child: Container(
          child: CupertinoPicker(
            magnification: 1.1,
            backgroundColor: Colors.white,
            children: <Widget>[
              Container(
                child: Text("Yağlı", style: TextStyle()),
                alignment: Alignment.center,
              ),
              Container(
                child: Text("Çorba", style: TextStyle()),
                alignment: Alignment.center,
              ),
              Container(
                child: Text("Sucuk", style: TextStyle()),
                alignment: Alignment.center,
              ),
            ],
            itemExtent: 50, //height of each item
            looping: false,
            onSelectedItemChanged: (int index) {
              selectFood = index;
            },
          ),
        ),
      ),
    );
  }

  Future timePicker(BuildContext context, {double height}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: height ?? MediaQuery.of(context).size.height / 3,
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          minuteInterval: 1,
          secondInterval: 1,
          initialTimerDuration: initialtimer,
          onTimerDurationChanged: (Duration changedtimer) {
            setState(
              () {
                initialtimer = changedtimer;
                screenTime = changedtimer.inHours.toString() +
                    ' hrs ' +
                    (changedtimer.inMinutes % 60).toString() +
                    ' mins ' +
                    (changedtimer.inSeconds % 60).toString() +
                    ' secs';
              },
            );
          },
        ),
      ),
    );
  }
}
