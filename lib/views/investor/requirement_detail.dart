import 'package:flutter/material.dart';
import 'package:flutterio/models/requirement.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            width: screenWidth*.85,
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

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 25,
          ),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          "Liste Detayı",
          style: TextStyle(
              fontSize: 25, fontFamily: "Quicksand-Light", color: Colors.white),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:12.0),
          child: Column(
            children: [
              information(screenWidth, FontAwesomeIcons.school, "Okul Adı: ", requirement.schoolName),
              information(screenWidth, FontAwesomeIcons.chalkboardTeacher, "Öğretmen Adı", requirement.teacherName),
              requirement.length == null ?
                  Text("No Product"):
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.shoppingCart, color: Colors.grey,),
                  Container(
                      width: screenWidth*.85,
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
                                decoration: BoxDecoration(color: Colors.blueAccent ,borderRadius: BorderRadius.all(Radius.circular(5))),
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
        ),
      ),
    );
  }
}
