import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnBoarding extends StatelessWidget {

  List headers = ["Takip Et", "Sürdür", "Arttır"];
  List descriptions = ["Her gün yaptıklarını girerek ne kadar sürdürülebilir olduğunu öğren!", "Hayatını sürdürülebilir kılmak için yapman gerekenleri uygulama içinden öğren!", "Sürdürülebilir bir yaşam için kullanacağın ürünleri değiştir. Sürdürülebilirlik açığını kapatmak için doğru ürünlere ulaş!"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdff8ff),
      body: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/${(index+1)}.png"),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xff3867fe),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text(headers[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).textScaleFactor*24),),
                      SizedBox(height: 30,),
                      Text(descriptions[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).textScaleFactor*18),),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(),
      ),
    );
  }
}
//3867fe