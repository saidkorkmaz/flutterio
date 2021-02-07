import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/view_models/product_model.dart';

import '../../globals.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {

  final _nameEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _phoneEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sellerModel = getIt<ProductModel>();
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [

              FutureBuilder(
                    future: sellerModel.getSellers(),
                    builder: (context, snapshot){
                      if(!snapshot.hasData)
                      {
                        print("Veri yok");
                        return Center(child: CircularProgressIndicator());
                      }
                      else
                      {
                        print("Veri var");
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            TextField(
                              controller: _nameEditingController,
                              decoration: InputDecoration(
                                  hintText: documents[0]["MARKET_NAME"],
                                prefixIcon: Icon(Icons.person, color:colorSecondaryTint)
                              ),
                            ),

                            TextField(
                              controller: _nameEditingController,
                              decoration: InputDecoration(
                                  hintText: documents[0]["PHONE"],
                                  prefixIcon: Icon(Icons.phone, color:colorSecondaryTint)
                              ),
                            ),

                            TextField(
                              controller: _nameEditingController,
                              decoration: InputDecoration(
                                  hintText: documents[0]["ADDRESS"],
                                  prefixIcon: Icon(Icons.home, color:colorSecondaryTint)
                              ),
                            ),

                          ],
                        );
                      }
                    },
                  ),

               Align(
                 alignment: Alignment.bottomCenter,
                 child: InkWell(
                   onTap: (){
                     Fluttertoast.showToast(
                         msg: "Profil kaydedildi",
                         timeInSecForIosWeb: 2,
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.CENTER,
                         backgroundColor: Colors.green,
                         textColor: Colors.white,
                         fontSize: 14);
                   },
                   child: Container(
                     height: size.height*0.05,
                     decoration: BoxDecoration(
                         color: colorSecondaryShade,
                         borderRadius: BorderRadius.all(
                             Radius.circular(10))),
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Center(
                           child: Text(
                             "Kaydet",
                             style: TextStyle(color: Colors.white),
                           )),
                     ),
                   ),
                 ),
               )

            ],
          ),
        ));
  }
}
/*


 */