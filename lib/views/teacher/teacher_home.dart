import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/navigator_service.dart';
import 'package:flutterio/globals.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:flutterio/views/teacher/list_seller_products.dart';
import 'package:flutterio/views/teacher/showCart.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TeacherHome extends StatefulWidget {
  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  var model = getIt<NavigatorService>();
  var productModel = getIt<ProductModel>();
  @override
  Widget build(BuildContext context) {
    var outModel = getIt<LoginModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Marketler"),
        actions: [Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                  onTap: (){
                    outModel.signOut();
                  },
                  child: Icon(Icons.close) ),
            ),
            IconButton(icon: Icon(Icons.shopping_bag_outlined), onPressed: (){
              print("Sepete basıldı");

              if(cart == null || cart.isEmpty)
                {
                  Fluttertoast.showToast(
                      msg: "Henüz ürün eklemediniz",
                      timeInSecForIosWeb: 2,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.grey[600],
                      textColor: Colors.white,
                      fontSize: 14);
                }
              else{
                model.navigateTo(ShowCart());
              }

            }),
          ],
        )],
      ),
        body:
        Container(
          child: FutureBuilder(
            future: productModel.getSellers(),
            builder: (context, snapshot){
              if(!snapshot.hasData)
                {
                  print("Veri yok");
                  return Center(child: CircularProgressIndicator());
                }
              else
                {
                  print("Veri var");
                  print(snapshot.data.docs[0]["MARKET_NAME"]);
                  List<DocumentSnapshot> documents = snapshot.data.docs;
                  return ListView.separated(
                      separatorBuilder: (_, __) => Divider(height: 0.5),
                      itemCount: documents.length ,
                      itemBuilder: (context, index) {
                        return 
                          InkWell(
                            onTap: () async => await model.navigateTo(ListSellerProducts(seller: documents[index])),
                            child: Card(
                                child: ListTile(
                                  title: Text(documents[index]["MARKET_NAME"]),
                                  trailing: Icon(Icons.keyboard_arrow_right_rounded),
                                )),
                          );
                      });
                }
            },
          ),
        )
    );
  }
}
