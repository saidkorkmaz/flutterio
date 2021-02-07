import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class SellerModel extends BaseModel {

  CollectionReference _ref;

  Future<void> updateSeller(String name, String phone, String address) {
    _ref = FirebaseFirestore.instance.collection('Users');
    notifyListeners();

    return _ref.doc('OJaDzeJXd5QvKWG66sfa9QStzyq2').update({
      "MARKET_NAME" : name,
      "ADDRESS" : address,
      "PHONE" : phone
    });
  }

}
