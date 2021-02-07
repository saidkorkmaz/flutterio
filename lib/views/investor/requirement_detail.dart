import 'package:flutter/material.dart';
import 'package:flutterio/models/requirement.dart';

class RequirementDetail extends StatelessWidget {
  final Requirement requirement;
  RequirementDetail({Key key, this.requirement}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child:Text(requirement.schoolName)
      ),
    );
  }
}
