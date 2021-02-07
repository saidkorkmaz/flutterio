import 'package:flutter/material.dart';
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
          child: Text("Harita")
        ),
      )

    ));
  }
}
