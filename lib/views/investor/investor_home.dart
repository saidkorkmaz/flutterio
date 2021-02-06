import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/models/requirement.dart';
import 'package:flutterio/view_models/requirement_model.dart';
import 'package:provider/provider.dart';
/*
class InvestorHome extends StatefulWidget {
  @override
  _InvestorHomeState createState() => _InvestorHomeState();
}

class _InvestorHomeState extends State<InvestorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
*/
class InvestorHome extends StatelessWidget {
  const InvestorHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = getIt<RequirementModel>();
 //   final user = Provider.of<RequirementModel>(context).currentUser;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => model,
        child: StreamBuilder<List<Requirement>>(
          stream: model.requirements(),
          builder: (BuildContext context, stream) {
            if (stream.hasError) {
              return Text('Error: ${stream.error}');
            }

            if (stream.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            }

            return ListView(
              children: stream.data
                  .map(
                    (requirement) => ListTile(
                 /* leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(requirement)),*/
                  title: Text(requirement.teacherName),
                  subtitle:
                  Container(child: Text(requirement.schoolName)),
                  onTap: () {
                   /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversationPage(
                          conversation: conversation,
                          userId: user.uid,
                        ),
                      ),
                    );*/
                  },
                  trailing: Column(
                    children: <Widget>[
                      Text(requirement.totalPrice.toString()),
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).accentColor),
                        child: Center(
                          child: Text(
                            "16",
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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