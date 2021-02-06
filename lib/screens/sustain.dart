import 'package:flutter/material.dart';
import 'package:sustainable_tracker/components/sustainDonation.dart';
import 'package:sustainable_tracker/model/increaseSustainability.dart';
import 'package:sustainable_tracker/components/sustainListItem.dart';

import '../constant.dart';

class SustainScreen extends StatefulWidget {
  SustainScreen({Key key}) : super(key: key);

  @override
  _SustainScreenState createState() => _SustainScreenState();
}

class _SustainScreenState extends State<SustainScreen> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.45;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xff276375), const Color(0xff050D10)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : categoryHeight,
                child: SustainDonation()),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Text("Sürdürülebilir Ürünler", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).textScaleFactor*24),),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: itemList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SustainListItem(url: itemList[index]["url"], imageUrl: itemList[index]["imageUrl"], brand: itemList[index]["brand"], name: itemList[index]["name"],);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
