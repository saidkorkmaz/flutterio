import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/models/requirement.dart';
import 'package:flutterio/view_models/requirement_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../globals.dart';

class RequirementDetail extends StatelessWidget {
  final Requirement requirement;
  final int length;
  RequirementDetail({Key key, this.requirement, this.length}) : super(key: key);

  Widget information(screenWidth, iconName, title, trailing){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(iconName, color: Colors.grey,),
        Container(
          //height: 100,
            width: screenWidth*.75,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                title: Text(title ,textScaleFactor: 1,),
                trailing: Text(trailing,textScaleFactor: 1,),
              ),
            )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var model = getIt<RequirementModel>();

    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: Scaffold(
        appBar: AppBar(

          title: Text("Bağış Detayları"),
          leading: InkWell(

            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25,
            ),
            onTap: () => Navigator.pop(context),
          ),
          backgroundColor: colorPrimaryShade,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 30,),
                    information(screenWidth, FontAwesomeIcons.school, "Okul Adı: ", requirement.schoolName),
                    information(screenWidth, FontAwesomeIcons.chalkboardTeacher, "Öğretmen Adı", requirement.teacherName),
                    SizedBox(height: 10,),

                    requirement.length == null ?
                        Text("No Product"):

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(FontAwesomeIcons.shoppingCart, color: Colors.grey,),
                        Container(
                            width: screenWidth*.75,
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            child:
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: requirement.length,
                                      itemBuilder: (context, index)
                                      {
                                        return ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                          title: Text(requirement.products.name),
                                          subtitle:
                                              Text("1"+ " adet"),
                                          trailing: Text(requirement.products.price.toString() + "₺",textScaleFactor: 1,),
                                        );
                                      },
                                      separatorBuilder: (a,b)=>Divider(),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      //height: 45,
                                      width: screenWidth*.85,
                                      decoration: BoxDecoration(color: colorSecondaryShade,borderRadius: BorderRadius.all(Radius.circular(5))),
                                      child:Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Toplam" ,style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Quicksand-Regular"),textScaleFactor: 1),
                                            Text("${requirement.totalPrice} ₺" ,style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Quicksand-SemiBold"),textScaleFactor: 1),



                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                requirement.totalPrice < 50 ?
                Text("${50-requirement.totalPrice}₺ daha bağış yaparsan ${requirement.totalPrice~/50} fidan hediye!" ,style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Quicksand-Regular"),textScaleFactor: 1):
                Text("${requirement.totalPrice~/50} tane fidan kazanacaksın!" ,style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Quicksand-Regular"),textScaleFactor: 1),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: colorSecondaryShade,

                    child: Text("Bağış Yap",style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: (){
                      model.makeDonation(requirement.totalPrice, requirement.id);
                      Fluttertoast.showToast(
                          msg: "Bağış yapıldı!",
                          timeInSecForIosWeb: 2,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.grey[600],
                          textColor: Colors.white,
                          fontSize: 14);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
