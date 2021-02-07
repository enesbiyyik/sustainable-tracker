import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SustainListItem extends StatelessWidget {
  final String url;
  final String imageUrl;
  final String name;
  final String brand;
  const SustainListItem({Key key, this.url, this.imageUrl, this.name, this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: AspectRatio(
        aspectRatio: 5/2,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 12, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).textScaleFactor*18),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          onPressed: (){
                            launchShop(url);
                          },
                          child: Text("Satın Al", style: TextStyle(color: Colors.white),),
                          color: Color(0xff4ca973),
                        ),
                        Text(brand)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(0,4), blurRadius: 5),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchShop(String link) async {
      await launch(
        link,
        forceSafariVC: true,
        forceWebView: true,
      );
  }
}
