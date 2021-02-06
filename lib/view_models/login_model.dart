import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/authentication_service.dart';
import 'package:flutterio/core/services/user_service.dart';
import 'package:flutterio/views/investor/investor_home.dart';
import 'package:flutterio/views/login.dart';
import 'package:flutterio/views/seller/seller_home.dart';
import 'package:flutterio/views/teacher/teacher_home.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthService _authService = getIt<AuthService>();
  final UserService _userService = getIt<UserService>();

  User get currentUser => _authService.currentUser;

  Future<void> signIn(String email, String password) async {
    busy = true;

    try {
      var user = await _authService.signIn(email, password);
      print("User id :${user.uid}");
      var userData = await _userService.getUserData(user.uid);
      var navigatePage;
      if(userData.data()["TYPE"] == "SELLER"){
        navigatePage = SellerHome(); //print("SELLER");
      }else if(userData.data()["TYPE"] == "TEACHER"){
        navigatePage = TeacherHome(); //print("TEACHER");
      }else if(userData.data()["TYPE"] == "INVESTOR"){
        navigatePage = InvestorHome(); //print("INVESTOR");
      }
      await navigatorService.navigateToReplace(navigatePage);
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
