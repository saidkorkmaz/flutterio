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
    _ref = FirebaseFirestore.instance.collection('Users/id/');

    return _ref.where('PRODUCT').snapshots();
  }

  Future<DocumentReference> addProduct(Map<String, dynamic> data) {
    mediaUrl = '';

    notifyListeners();

    return _ref.add(data);
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
