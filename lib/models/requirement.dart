import 'package:cloud_firestore/cloud_firestore.dart';

class Requirement {
  String id;
  List products;
  String teacherName;
  String schoolName;
  int totalPrice;

  Requirement(
      this.id,
      this.products,
      this.teacherName,
      this.schoolName,
      this.totalPrice,
      );

  factory Requirement.fromSnapshot(
      DocumentSnapshot snapshot) {
    return Requirement(
      snapshot.id,
      snapshot.data()['PRODUCT_LIST'],
      snapshot.data()['SCHOOL_NAME'],
      snapshot.data()['TEACHER_NAME'],
      snapshot.data()['TOTAL_PRICE'],
    );
  }
}