import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/models/requirement.dart';
import 'package:flutterio/view_models/requirement_model.dart';
import 'package:provider/provider.dart';

class InvestorHome extends StatelessWidget {
  const InvestorHome({Key key}) : super(key: key);

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
            if (stream.hasError) {
              return Text('Error: ${stream.error}');
            }

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