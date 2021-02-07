import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterio/globals.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:flutterio/views/login.dart';
import 'package:provider/provider.dart';

import 'core/locator.dart';
import 'core/services/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt<LoginModel>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fluttrio',
        navigatorKey: getIt<NavigatorService>().navigatorKey,
        theme: ThemeData(
          fontFamily: "QuickSand-Medium",
          //canvasColor: Colors.transparent
          primaryColor: colorPrimaryShade,
          accentColor: colorPrimary,
        ),
        home: Consumer<LoginModel>(
          builder: (BuildContext context, LoginModel loginModel,
                  Widget child) =>
              loginModel.currentUser == null ? LoginPage() :
              FutureBuilder(future: loginModel.getUser(loginModel.currentUser.uid),
              builder: (context, snapshot){

                  return Scaffold(body:Center(child: CircularProgressIndicator(),));

              },),
        ),
      ),
    );
  }
}
