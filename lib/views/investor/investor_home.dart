import 'package:flutter/material.dart';
import 'package:flutterio/views/investor/investor_profile.dart';
import 'package:flutterio/views/investor/requirement_list.dart';
import 'package:flutterio/views/seller/seller_profile.dart';

import '../../globals.dart';

class InvestorHome extends StatefulWidget {
  const  InvestorHome({Key key}) : super(key: key);

  @override
  _InvestorHomeState createState() => _InvestorHomeState();
}

class _InvestorHomeState extends State<InvestorHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Container(
        color: colorPrimaryShade,
        child: SafeArea(
          child:  Column(
              children: <Widget>[
                TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      text: "İhtiyaç Listeleri",
                    ),
                    Tab(
                      text: "Profilim",
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        RequirementList(),
                        InvestorProfile(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }
}