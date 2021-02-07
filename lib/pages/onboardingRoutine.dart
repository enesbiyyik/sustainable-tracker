import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_tracker/components/pickerListTile.dart';
import 'package:sustainable_tracker/constants.dart';
import 'package:sustainable_tracker/pages/homePage.dart';

class RoutinePicker extends StatefulWidget {
  @override
  _RoutinePickerState createState() => _RoutinePickerState();
}

class _RoutinePickerState extends State<RoutinePicker> {
  int pc = 0;
  int isikTuru = 0;
  int isik = 0;
  int su = 0;
  int isitmaTuru = 0;
  int isitma = 0;
  int otomobil = 0;
  int metro = 0;
  int otobus = 0;
  int ucak = 0;
  int yemekTuru = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next, size: 36),
        onPressed: () {
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => HomePage()));
          hesapla();
          debugPrint(dusulcekPuan.toString());
          debugPrint(pc.toString());
          debugPrint(isikTuru.toString());
          debugPrint(isik.toString());
          debugPrint(su.toString());
          debugPrint(isitmaTuru.toString());
          debugPrint(isitma.toString());
          debugPrint(otomobil.toString());
          debugPrint(metro.toString());
          debugPrint(otobus.toString());
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.only(
                top: 60,
                left: 18,
              ),
              child: Text(
                "Rutinler",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).textScaleFactor * 28,
                    fontWeight: FontWeight.w600),
              ),
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
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.computer,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Bilgisayar Kullanımı",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            pc = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[pc]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      
                      //////////////////////////////////////////////////////////////////
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.lightbulb,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Aydınlatma Türü",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: lightType.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(lightType[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            isikTuru = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${lightType[isikTuru]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.lightbulb,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Aydınlatma Kullanımı",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            isik = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[isik]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.water_damage_outlined,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Su Kullanımı",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            su = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[su]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.thermostat_rounded,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Isıtma Türü",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: heatType.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(heatType[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            isitmaTuru = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${heatType[isitmaTuru]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.thermostat_rounded,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Isıtma Kullanımı",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            isitma = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[isitma]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.directions_car,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Araba Kullanımı (Günlük)",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            otomobil = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[otomobil]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.airplanemode_active,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Uçak Kullanımı (Yıllık)",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            ucak = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[ucak]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.directions_railway,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Metro Kullanımı (Günlük)",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            metro = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[metro]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.directions_bus,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Otobüs Kullanımı (Günlük)",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: time.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(time[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            otobus = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${time[otobus]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.food_bank,
                                size: 30, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Color(0xff45D1FD),
                                border: Border.all(
                                    color: Color(0xff45D1FD), width: 0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text("Yemek Türü",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          trailing: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          topRight: Radius.circular(13))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Container(
                                      child: CupertinoPicker.builder(
                                        childCount: foodType.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(foodType[index]));
                                        },
                                        magnification: 1,
                                        backgroundColor: Colors.white,
                                        itemExtent: 50,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            yemekTuru = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${foodType[yemekTuru]}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Düzenle"),
                                ],
                              ),
                              height: 10,
                              minWidth: 10,
                              color: Colors.white),
                        ),
                      ),
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

  void hesapla() {
    if (pc == 0) {
    } else if (pc == 1) {
      dusulcekPuan = dusulcekPuan + 1;
    } else if (pc == 2) {
      dusulcekPuan = dusulcekPuan + 2;
    } else if (pc == 3) {
      dusulcekPuan = dusulcekPuan + 3;
    } else if (pc >= 4) {
      dusulcekPuan = dusulcekPuan + (((pc - 4) + 1) * 4);
    } else {}
    if (isikTuru == 0) {
    } else {
      if (pc == 0) {
      } else if (pc == 1) {
        dusulcekPuan = dusulcekPuan + 1;
      } else if (pc == 2) {
        dusulcekPuan = dusulcekPuan + 2;
      } else if (pc == 3) {
        dusulcekPuan = dusulcekPuan + 3;
      } else if (pc >= 4) {
        dusulcekPuan = dusulcekPuan + (((isik - 4) + 1) * 4);
      }
    }
    if (su == 0) {
    } else if (su < 5) {
      dusulcekPuan = dusulcekPuan + su;
    } else if (su >= 5) {
      dusulcekPuan = dusulcekPuan + (((su - 4) + 1) * 4);
    } else {}
    if (isitmaTuru == 0) {
      if (isitma >= 4) {
        dusulcekPuan = dusulcekPuan + ((isitma - 3) * 1);
      } else {}
    } else if (isitmaTuru == 1) {
      if (isitma > 4) {
        dusulcekPuan = dusulcekPuan + ((isitma - 3) * 2);
      } else {}
    } else if (isitmaTuru == 2) {
      if (isitma >= 4) {
        dusulcekPuan = dusulcekPuan + ((isitma - 3) * 4);
      } else {}
    } else {}
    if (otomobil == 0) {
    } else if (otomobil == 1) {
      dusulcekPuan = dusulcekPuan + 1;
    } else if (otomobil == 2) {
      dusulcekPuan = dusulcekPuan + 2;
    } else if (otomobil == 3) {
      dusulcekPuan = dusulcekPuan + 3;
    } else if (otomobil >= 4) {
      dusulcekPuan = dusulcekPuan + (((pc - 4) + 1) * 4);
    } else {}
    dusulcekPuan = dusulcekPuan + ((ucak - 3) * 1);
    if (metro >= 4) {
      dusulcekPuan = dusulcekPuan + ((metro - 3) * 1);
    } else {}
    if (otobus >= 4) {
      dusulcekPuan = dusulcekPuan + ((otobus - 3) * 1);
    } else {}
    if (yemekTuru == 0) {
    } else if (yemekTuru == 2) {
      dusulcekPuan = dusulcekPuan + 1;
    } else if (yemekTuru == 3) {
      dusulcekPuan = dusulcekPuan + 3;
    } else if (yemekTuru == 4) {
      dusulcekPuan = dusulcekPuan + 5;
    } else if (yemekTuru == 5) {
      dusulcekPuan = dusulcekPuan + 7;
    } else {
      dusulcekPuan = dusulcekPuan + 9;
    }
  }
}
