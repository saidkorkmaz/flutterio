import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService{
  final refUsersCollection = FirebaseFirestore.instance.collection("Users");

  Future<QuerySnapshot> getSellers() async {
    return refUsersCollection.where("TYPE", isEqualTo: "SELLER").get();
  }

}