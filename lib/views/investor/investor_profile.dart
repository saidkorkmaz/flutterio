import 'package:flutter/material.dart';
import 'package:flutterio/features/maps.dart';
import 'package:flutterio/globals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InvestorProfile extends StatefulWidget {
  @override
  _InvestorProfileState createState() => _InvestorProfileState();
}

class _InvestorProfileState extends State<InvestorProfile> {
  int plantsQty = currentInvestor.totalAmount~/50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Center(


        child: Column(
          children: [
            Text(currentInvestor.name),
            Text(currentInvestor.totalAmount.toString() + " ₺"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(plantsQty.toString() + "adet"),
                Icon(FontAwesomeIcons.tree, color: Colors.green,),
              ],
            ),
            RaisedButton(
              child: Text("Harita"),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlantsMap(plantsQty)));          },
            ),
          ],
        ),
      )

    ));
  }
}
