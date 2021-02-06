import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/storage.dart';
import 'package:image_picker/image_picker.dart';

import 'base_model.dart';

class ProductModel extends BaseModel {
  final StorageService _storageService = getIt<StorageService>();
  CollectionReference _ref;
  String mediaUrl = '';

  Stream<QuerySnapshot> getProducts() {
    _ref = FirebaseFirestore.instance.collection('Person/docSeller/Products');

    return _ref.orderBy('TIME_STAMP').snapshots();
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
}
