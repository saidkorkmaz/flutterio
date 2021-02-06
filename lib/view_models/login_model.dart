import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/authentication_service.dart';
import 'package:flutterio/views/investor/investor_home.dart';
import 'package:flutterio/views/login.dart';
import 'package:flutterio/views/seller/seller_home.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthService _authService = getIt<AuthService>();

  User get currentUser => _authService.currentUser;

  Future<void> signIn(String email, String password) async {
    busy = true;

    try {
      var user = await _authService.signIn(email, password);
      print("User id :${user.uid}");

      await navigatorService.navigateToReplace(InvestorHome());
    } catch (e) {
      busy = false;
    }

    busy = false;
  }

  Future<void> signOut() async {
    busy = true;

    try {
      var user = await _authService.signOut();
      await navigatorService.navigateToReplace(LoginPage());
    } catch (e) {
      busy = false;
    }

    busy = false;
  }
}
