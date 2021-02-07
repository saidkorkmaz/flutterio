import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/navigator_service.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:flutterio/views/seller/product_add.dart';
import 'package:flutterio/views/seller/product_list.dart';
import 'package:flutterio/views/seller/seller_profile.dart';

class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome>  with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _showMessage = true;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _tabController.addListener(() {
      _showMessage = _tabController.index == 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = getIt<NavigatorService>();
    var outModel = getIt<LoginModel>();
    var sellerModel = getIt<ProductModel>();
    return Scaffold(
        floatingActionButton: _showMessage
            ? FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () async {
            await model.navigateTo(ProductAdd());
          },
        ) : null,

        body:Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    title: FutureBuilder(
                      future: sellerModel.getSellers(),
                      builder: (context, snapshot){
                        if(!snapshot.hasData)
                        {
                        //  print("Veri yok");
                          return Container();
                        }
                        else
                        {
                         // print("Veri var");
                         // print(snapshot.data.docs[0]["MARKET_NAME"]);
                          List<DocumentSnapshot> documents = snapshot.data.docs;
                          return Text(documents[0]["MARKET_NAME"]);
                        }
                      },
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                            onTap: (){
                              outModel.signOut();
                            },
                            child: Icon(Icons.close) ),
                      )
                    ],
                  )
                ];
              },
              body: Column(
                children: <Widget>[
                  TabBar(
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(
                        text: "Ürünler",
                      ),
                      Tab(
                       text: "Profil",
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          ProductList(),
                          SellerProfile(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
