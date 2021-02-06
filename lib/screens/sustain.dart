import 'package:flutter/material.dart';
import 'package:sustainable_tracker/components/sustainGridItem.dart';

class SustainScreen extends StatelessWidget {

  SustainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/4), 
      itemBuilder: (context, index){
        return SustainGridItem(); 
      },
    );
  }
}