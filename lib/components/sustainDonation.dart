import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SustainDonation extends StatelessWidget {
  const SustainDonation();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                flex: 15,
                child: Image.network("http://via.placeholder.com/288x188", fit: BoxFit.fill,),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Text("ANAN SUCO", style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*24, fontWeight: FontWeight.w600,),),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Text("anan suco description", style: TextStyle(fontSize: MediaQuery.of(context).textScaleFactor*16, fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
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
    );
  }
}