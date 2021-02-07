import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterio/models/seller.dart';
import 'package:rxdart/rxdart.dart';

import '../locator.dart';
import 'authentication_service.dart';

class SellerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final AuthService _authService = getIt<AuthService>();

  User get currentUser => _authService.currentUser;

  Future<List<Seller>> getProducts() async {
    var id = currentUser.uid;
    var userSnapshot = await _firestore.collection('Users').doc(id).get();
    userSnapshot.get("MARKET_NAME");
    userSnapshot.get("PRODUCTS");

   // return Seller(sellerName: profile.userName, products: profile.image);
  }
}
