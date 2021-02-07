import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/features/maps.dart';
import 'package:flutterio/globals.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InvestorProfile extends StatefulWidget {
  @override
  _InvestorProfileState createState() => _InvestorProfileState();
}

class _InvestorProfileState extends State<InvestorProfile> {
  int plantsQty = currentInvestor.totalAmount ~/ 50;

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    var outModel = getIt<LoginModel>();
    return Scaffold(
        body: Container(
      child: Padding(
        padding: EdgeInsets.only(
            top: screenHeigth * 0.10, bottom: screenHeigth * 0.20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(currentInvestor.name, style: TextStyle(fontSize: 25)),
            SizedBox(
              height: 35,
            ),
            Text(
                "Bugüne kadar ${currentInvestor.totalAmount.toString()} ₺ bağışta bulundun"),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(plantsQty.toString() + " adet",
                    style: TextStyle(fontSize: 20)),
                Icon(
                  FontAwesomeIcons.tree,
                  color: Colors.green,
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            InkWell(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantsMap(plantsQty)),
                    ),
                child: Image.asset('assets/images/plant.png')),
            SizedBox(
              height: 10,
            ),
            Text("Fidan haritanızı görmek için tıklayın"),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Çıkış Yap",style: TextStyle(color: Colors.white)),
              color: Colors.redAccent,
              onPressed: () {
                outModel.signOut();
              },
            ),

            /*RaisedButton(
                child: Text("Harita"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantsMap(plantsQty)));          },
              ),*/
          ],
        ),
      ),
    ));
  }
}
