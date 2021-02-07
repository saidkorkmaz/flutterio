import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String image;
  String qty;
  int price;

  Product({this.id, this.name, this.image, this.qty, this.price});
  fromMap(Map<String, dynamic> map){
    this.id = "0";
    this.name = map["NAME"];
    this.image = map["IMAGE"];
    this.price = map["PRICE"];
  }
}
