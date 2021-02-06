import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String image;
  String qty;
  String price;

  Product({this.id, this.name, this.image, this.qty, this.price});
}
