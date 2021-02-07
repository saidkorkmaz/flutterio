import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:flutterio/view_models/seller_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../globals.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  final _nameEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _phoneEditingController = TextEditingController();

  var model = getIt<SellerModel>();

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
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                //print("Veri yok");
                return Center(child: CircularProgressIndicator());
              } else {
                //print("Veri var");
                List<DocumentSnapshot> documents = snapshot.data.docs;
                print(documents[0]);
                return Column(
                  children: [
                    TextField(
                      controller: _nameEditingController,
                      decoration: InputDecoration(
                          hintText: documents[0]["MARKET_NAME"],
                          prefixIcon:
                              Icon(Icons.person, color: colorSecondaryTint)),
                    ),
                    TextField(
                      controller: _addressEditingController,
                      decoration: InputDecoration(
                          hintText: documents[0]["PHONE"],
                          prefixIcon:
                              Icon(Icons.phone, color: colorSecondaryTint)),
                    ),
                    TextField(
                      controller: _phoneEditingController,
                      decoration: InputDecoration(
                          hintText: documents[0]["ADDRESS"],
                          prefixIcon:
                              Icon(Icons.home, color: colorSecondaryTint)),
                    ),
                  ],
                );
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () async {
                if (_nameEditingController.text.isNotEmpty &&
                    _addressEditingController.text.isNotEmpty &&
                    _phoneEditingController.text.isNotEmpty) {
                  await model.updateSeller(
                      _nameEditingController.text,
                      _phoneEditingController.text,
                      _addressEditingController.text);
                  Fluttertoast.showToast(
                      msg: "Profil kaydedildi",
                      timeInSecForIosWeb: 2,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 14);
                } else {
                  Fluttertoast.showToast(
                      msg: "Boşluk bırakmayın",
                      timeInSecForIosWeb: 2,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 14);
                }
              },
              child: Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: colorSecondaryShade,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
