import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sustainable_tracker/pages/signUp.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List headers = ["Takip Et", "Sürdür", "Arttır"];
  List descriptions = [
    "Her gün yaptıklarını girerek ne kadar sürdürülebilir olduğunu öğren!",
    "Hayatını sürdürülebilir kılmak için yapman gerekenleri uygulama içinden öğren!",
    "Sürdürülebilir bir yaşam için kullanacağın ürünleri değiştir. Sürdürülebilirlik açığını kapatmak için doğru ürünlere ulaş!"
  ];
  PageController controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdff8ff),
      body: PageView.builder(
        controller: controller,
        pageSnapping: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return new Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                          fit: BoxFit.contain)),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/${(index + 1)}.png"),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    color: Color(0xff3867fe),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        headers[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 24),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        descriptions[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).textScaleFactor * 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.maxFinite,
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            if (index == 2) {
                              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => SignUp()));
                            } else {
                              setState(() {
                                controller.animateToPage(index + 1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                              });
                            }
                          },
                          child: Text("Devam"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
//3867fe
