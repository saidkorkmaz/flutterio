import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterio/globals.dart';

class UserService {
  final refUsersCollection = FirebaseFirestore.instance.collection("Users");

  Future<DocumentSnapshot> getUserData(String docId) async {
    return await refUsersCollection.doc(docId).get();
  }
  saveTotalAmount(String userId, int totalPrice){
    print(userId);
    print("amount: $totalPrice");
    print("currentamount: ${currentInvestor.totalAmount}");
    refUsersCollection.doc(userId).update({"TOTAL_AMOUNT":totalPrice});

  }
}
