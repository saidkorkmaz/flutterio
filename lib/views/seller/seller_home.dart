import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/navigator_service.dart';
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
                    title: Text("Defterci"),
                    actions: <Widget>[
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
