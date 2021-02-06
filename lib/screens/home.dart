import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sliderValue = 15; //SetState yok en güncel hali gelmeli

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Background Color
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff276375), const Color(0xff050D10)],
            ),
          ),
        ),

        Column(
          children: [
            slider(),
            scores(),
          ],
        ),
      ],
    );
  }

  //Slider Bar & Score
  Widget slider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${sliderValue.round().toString()}",
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
              value: sliderValue,
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
        MediaQuery.of(context).size.width / 10, //Left
        MediaQuery.of(context).size.height / 10, //Top
        MediaQuery.of(context).size.width / 10, //Right
        MediaQuery.of(context).size.height / 10, //Botttom
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff4898E7), width: 3),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${sliderValue.round().toString()}",
                        style: TextStyle(fontSize: 20)),
                    Text(" / 100", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff4898E7), width: 3),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${sliderValue.round().toString()}",
                        style: TextStyle(fontSize: 20)),
                    Text(" / 100", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff4898E7), width: 3),
              borderRadius: BorderRadius.circular(75),
            ),
          ),
        ],
      ),
    );
  }
}
