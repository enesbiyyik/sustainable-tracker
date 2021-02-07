import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_tracker/components/pickerListTile.dart';
import 'package:sustainable_tracker/constants.dart';
import 'package:sustainable_tracker/pages/homePage.dart';

class DailyRoutinePicker extends StatefulWidget {
  @override
  _DailyRoutinePickerState createState() => _DailyRoutinePickerState();
}

class _DailyRoutinePickerState extends State<DailyRoutinePicker> {
  static int pc = 0;
  static int isikTuru = 0;
  static int isik = 0;
  static int su = 0;
  static int isitmaTuru = 0;
  static int isitma = 0;
  static int otomobil = 0;
  static int metro = 0;
  static int otobus = 0;
  static int ucak = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next, size: 36),
        onPressed: (){
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
                padding: EdgeInsets.only(top: 40, left: 18,),
                child: Text("Rutinler", style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).textScaleFactor*28, fontWeight: FontWeight.w600),),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    tileMode: TileMode.mirror,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xff276375), const Color(0xff050D10)],
                  ),
                ),
              ),
            ),
          Positioned.fill(
            top: 80,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PickerListTile(Icons.computer, "Bilgisayar Kullanımı", time, pc),
                      PickerListTile(Icons.lightbulb, "Aydınlatma Türü", lightType, isikTuru),
                      PickerListTile(Icons.lightbulb, "Aydınlatma Kullanımı", time, isik),
                      PickerListTile(Icons.water_damage_outlined, "Su Kullanımı", time, su),
                      PickerListTile(Icons.thermostat_rounded, "Isıtma Türü", heatType, isitmaTuru),
                      PickerListTile(Icons.thermostat_rounded, "Isıtma Kullanımı", time, isitma),
                      Divider(),
                      PickerListTile(Icons.directions_car, "Otomobil Kullanımı (Günlük)", time, otomobil),
                      PickerListTile(Icons.airplanemode_active, "Uçak Kullanımı (Yıllık)", time, ucak),
                      PickerListTile(Icons.directions_railway, "Metro Kullanımı (Günlük)", time, metro),
                      PickerListTile(Icons.bus_alert, "Otobüs Kullanımı", time, otobus),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
