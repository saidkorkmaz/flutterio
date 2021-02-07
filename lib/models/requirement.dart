import 'package:cloud_firestore/cloud_firestore.dart';

class Requirement {
  String id;
  var products;
  String teacherName;
  String schoolName;
  int totalPrice;
  int length;
  bool status;

  Requirement(
      this.id,
      this.products,
      this.teacherName,
      this.schoolName,
      this.totalPrice,
      this.length,
      this.status,
      );

  factory Requirement.fromSnapshot(
      DocumentSnapshot snapshot) {
    return Requirement(
      snapshot.id,
      snapshot.data()['PRODUCT_LIST'],
      snapshot.data()['TEACHER_NAME'],
      snapshot.data()['SCHOOL_NAME'],
      snapshot.data()['TOTAL_PRICE'],
      null,
      snapshot.data()['STATUS'] ?? true,
    );
  }
}