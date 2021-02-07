import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/models/requirement.dart';
import 'package:flutterio/view_models/requirement_model.dart';
import 'package:provider/provider.dart';

class InvestorHome extends StatefulWidget {
  const InvestorHome({Key key}) : super(key: key);

  @override
  _InvestorHomeState createState() => _InvestorHomeState();
}

class _InvestorHomeState extends State<InvestorHome> {
  @override
  Widget build(BuildContext context) {
    final model = getIt<RequirementModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("İhtiyaç Listeleri"),
        backgroundColor: Colors.deepPurple ,
      ),
      body: ChangeNotifierProvider(
        create: (context) => model,
        child: StreamBuilder<List<Requirement>>(
          stream: model.requirements(),
          builder: (BuildContext context, stream) {


            if (stream.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: stream.data
                  .map(
                    (requirement) => ListTile(
                 /* leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(requirement)),*/
                  title: Text(requirement.schoolName),
                  subtitle:
                  Container(child: Text(requirement.teacherName)),
                  onTap: () {
                    model.openDetailPage(requirement);
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(requirement.totalPrice.toString() + " ₺"),

                    ],
                  ),
                ),
              )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}