import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final refUsersCollection = FirebaseFirestore.instance.collection("Users");

  Future<DocumentSnapshot> getUserData(String docId) async {
    return await refUsersCollection.doc(docId).get();
  }
}
