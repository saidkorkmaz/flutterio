import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/cart_service.dart';
import 'package:flutterio/globals.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListSellerProducts extends StatefulWidget {
  final DocumentSnapshot seller;
  ListSellerProducts({this.seller});
  @override
  _ListSellerProductsState createState() => _ListSellerProductsState();

}

class _ListSellerProductsState extends State<ListSellerProducts> {

  List products;
  var cartService = getIt<CartService>();

  @override
  void initState() {
  super.initState();
  products = widget.seller["PRODUCTS"];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.seller.data()["MARKET_NAME"]),
      ),
      body: ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 0.5),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return
              InkWell(
                onTap: () {
                  cartService.addCart(products[index]["NAME"], products[index]["IMAGE"], int.parse(products[index]["PRICE"].toString()));
                  Fluttertoast.showToast(
                      msg: "Ürün sepete eklendi",
                      timeInSecForIosWeb: 2,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 14);
                  },
                child: Card(
                    child: ListTile(
                      title: Text(products[index]["NAME"]),
                      trailing: Icon(Icons.add),
                    )),
              );
          }),
    );
  }


}
