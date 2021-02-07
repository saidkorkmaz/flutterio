import 'package:flutter/material.dart';
import 'package:flutterio/features/maps.dart';
class InvestorProfile extends StatefulWidget {
  @override
  _InvestorProfileState createState() => _InvestorProfileState();
}

class _InvestorProfileState extends State<InvestorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Center(
        child: RaisedButton(
          child: Text("Harita"),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlantsMap()));          },
        ),
      )

    ));
  }
}
