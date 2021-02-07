import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:provider/provider.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {

  final _nameEditingController = TextEditingController();
  String name;

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
                        return Container();
                      }
                      else
                      {
                        print("Veri var");
                        print(snapshot.data.docs[0]["MARKET_NAME"]);
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            Text("Firma adı"),
                            TextField(
                              controller: _nameEditingController,
                              decoration: InputDecoration(
                                  hintText: documents[0]["MARKET_NAME"]
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

                   },
                   child: Container(
                     height: size.height*0.05,
                     decoration: BoxDecoration(
                         color: Colors.red,
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