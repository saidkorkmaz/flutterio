import 'package:flutter/material.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:flutterio/views/investor/investor_home.dart';
import 'package:flutterio/views/login.dart';
import 'package:flutterio/views/seller/seller_home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

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
        title: 'Fruttio',
        navigatorKey: getIt<NavigatorService>().navigatorKey,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.redAccent,
        ),
        home: Consumer<LoginModel>(
          builder: (BuildContext context, LoginModel loginModel,
                  Widget child) =>
              loginModel.currentUser == null ? LoginPage() : SellerHome(),
        ),
      ),
    );
  }
}
