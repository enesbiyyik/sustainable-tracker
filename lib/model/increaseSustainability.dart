
import 'package:cloud_firestore/cloud_firestore.dart';

List<dynamic> itemList = [];

getSustainItems() async {
  DocumentSnapshot snapshot = await Firestore.instance.collection("data").document("products").get();
  itemList.addAll(snapshot.data["products"]);
}