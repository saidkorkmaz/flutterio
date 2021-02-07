import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterio/models/requirement.dart';


class RequirementService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var ref = FirebaseFirestore.instance.collection('Requirements');


  Future<List<Requirement>> getRequirements() async {
    var requirements = await ref.get();
    return requirements.docs.map((snapshot) => Requirement.fromSnapshot(snapshot)).toList();
  }
  
  addRequirement(List products, String schoolName, String teacherName, int totalPrice){
    _firestore.collection("Requirements").add({"PRODUCT_LIST": products, "SCHOOL_NAME" : schoolName, "TEACHER_NAME":teacherName, "TOTAL_PRICE":totalPrice});
  }

  updateStatus(String docId) {
    ref.doc(docId).update({"STATUS":false});

  }

}