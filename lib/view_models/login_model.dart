import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/authentication_service.dart';
import 'package:flutterio/core/services/user_service.dart';
import 'package:flutterio/globals.dart';
import 'package:flutterio/models/investor.dart';
import 'package:flutterio/models/teacher.dart';
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
      await getUser(user.uid);
    } catch (e) {
      print("HATA: $e");
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

   getUser(String userId) async {
    var userData = await _userService.getUserData(userId);
    var navigatePage;
    print("type: ${userData.data()["TYPE"]}");
    print("User TYPE : ${userData.data()["TYPE"]}");

    if(userData.data()["TYPE"] == "SELLER"){
      navigatePage = SellerHome(); print("SELLER");
    }else if(userData.data()["TYPE"] == "TEACHER"){
      currentTeacher = Teacher();
      currentTeacher.fromMap(userData.data());
      navigatePage = TeacherHome(); print("TEACHER");
    }else if(userData.data()["TYPE"] == "INVESTOR"){
      currentInvestor = Investor();
      currentInvestor.fromMap(userData.data(), userData.id);
      navigatePage = InvestorHome(); print("INVESTOR");
    }
    return await navigatorService.navigateToReplace(navigatePage);
  }
}
