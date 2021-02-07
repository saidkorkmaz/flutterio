import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterio/models/requirement.dart';


class RequirementService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Requirement>> getRequirements() async {
    var ref = _firestore.collection('Requirements');
    var requirements = await ref.get();
    return requirements.docs.map((snapshot) => Requirement.fromSnapshot(snapshot)).toList();
  }

}