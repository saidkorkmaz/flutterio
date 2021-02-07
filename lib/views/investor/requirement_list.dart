import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/globals.dart';
import 'package:flutterio/models/requirement.dart';
import 'package:flutterio/view_models/requirement_model.dart';
import 'package:provider/provider.dart';

class RequirementList extends StatefulWidget {
  const  RequirementList({Key key}) : super(key: key);

  @override
  _RequirementListState createState() => _RequirementListState();
}

class _RequirementListState extends State<RequirementList> {
  @override
  Widget build(BuildContext context) {
    final model = getIt<RequirementModel>();

    return Scaffold(

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
                    (requirement) =>  requirement.status == true ?ListTile(
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
                ):
                Container(),
              )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}