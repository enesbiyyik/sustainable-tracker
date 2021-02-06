import 'package:flutter/material.dart';
import 'package:sustainable_tracker/components/sustainGridItem.dart';

class SustainScreen extends StatelessWidget {
  SustainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            child: Text("ANAN DA ÖYLE DERDİ")
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2,
                    color: Colors.transparent,
                  ),
                  Container(       
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2,
                    color: Colors.green,
                  ),
                  Container(       
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
