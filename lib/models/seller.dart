import 'package:cloud_firestore/cloud_firestore.dart';

class Seller {
  String id;
  String sellerName;
  String phone;
  String address;
  List<dynamic> products;

  Seller({this.id, this.sellerName, this.products});

 fromMap(Map<String, dynamic> map){
   this.sellerName = map["MARKET_NAME"];
   this.products = map["PRODUCTS"];
   this.phone = map["PHONE"];
   this.address = map["ADDRESS"];
 }

 Map<String, dynamic> toMap(Seller _seller){
   return {
     "MARKET_NAME" : this.sellerName,
     "PRODUCTS" : this.products,
     "PHONE" : this.phone,
     "ADDRESS" : this.address
   };
 }


}
