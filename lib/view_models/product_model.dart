import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/product_service.dart';
import 'package:flutterio/core/services/storage_service.dart';
import 'package:image_picker/image_picker.dart';

import 'base_model.dart';

class ProductModel extends BaseModel {
  final StorageService _storageService = getIt<StorageService>();
  final ProductService _productService = getIt<ProductService>();

  CollectionReference _ref;
  String mediaUrl = '';

  Stream<QuerySnapshot> getProducts() {
    _ref = FirebaseFirestore.instance.collection('Users/');

    return _ref.where('PRODUCT').snapshots();
  }

  Future<void> addProduct(List<dynamic> data) {
    mediaUrl = '';
    _ref = FirebaseFirestore.instance.collection('Users');
    notifyListeners();

    return _ref.doc('OJaDzeJXd5QvKWG66sfa9QStzyq2').update({
      "PRODUCTS" : FieldValue.arrayUnion(data)
    });
  }

  uploadMedia(ImageSource source) async {
    var pickedFile = await ImagePicker().getImage(source: source);

    if (pickedFile == null) return;

    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));

    notifyListeners();
  }




  ///_----------------------------------------------------------_

  getSellers(){
   return _productService.getSellers();
  }
}
