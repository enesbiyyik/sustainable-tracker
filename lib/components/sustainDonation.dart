import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SustainDonation extends StatelessWidget {

  List basliklar = ["Damla", "Deniz", "Dünya"];

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 18,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage("assets/${(index+1)}.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(basliklar[index], style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*20, fontWeight: FontWeight.w600,),),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Text("anan suco description", style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*12, fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: Text("Bağış Yap!"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 3,
      scale: 0.9,
      viewportFraction: 0.8,
      controller: SwiperController(),
      autoplay: true,
      autoplayDelay: 3000,
    );
  }
}