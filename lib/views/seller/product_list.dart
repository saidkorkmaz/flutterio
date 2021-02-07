import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/cart_service.dart';
import 'package:flutterio/view_models/product_model.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List products;
  DocumentSnapshot seller;
  var productModel = getIt<ProductModel>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: FutureBuilder(
        future: productModel.getSellers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
           // print("Veri yok");
            return Center(child: CircularProgressIndicator());
          } else {
           // print("Veri var");
            //print(snapshot.data.docs[0]["MARKET_NAME"]);
            List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView.separated(
                separatorBuilder: (_, __) => Divider(height: 0.5),
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(documents[0]["PRODUCTS"][index]["NAME"]),
                    subtitle: Text(
                        documents[0]["PRODUCTS"][index]["PRICE"].toString()),
                    trailing: Container(
                        height: size.height * 0.1,
                        width: size.height * 0.1,
                        child: Image.network(documents[0]["PRODUCTS"][index]["IMAGE"])),
                  ));
                });
          }
        },
      ),
    ));
  }
}
