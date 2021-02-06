import 'package:flutter/material.dart';

class SustainGridItem extends StatelessWidget {
  const SustainGridItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1/1,
            child: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://cdn.shopify.com/s/files/1/0811/0945/products/1-1_ff900e19-d486-4126-84e8-3bc3a9ef8681_1200x.png?v=1568958231", fit: BoxFit.contain,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
