import 'package:cloud_firestore/cloud_firestore.dart';

class Seller {
  String id;
  String sellerName;
  List<dynamic> products;


  Seller({this.id, this.sellerName, this.products});

/*
  factory Seller.fromSnapshot(DocumentSnapshot snapshot) {
    return Seller(
        id: snapshot.id,
        sellerName: sellerName,
        products: profile.image,
        );
  }

 */

 fromMap(Map<String, dynamic> map){
   this.sellerName = map["MARKET_NAME"];
   this.products = map["PRODUCTS"];
 }

 Map<String, dynamic> toMap(Seller _seller){
   return {
     "MARKET_NAME" : this.sellerName,
     "PRODUCTS" : this.products
   };
 }


}
