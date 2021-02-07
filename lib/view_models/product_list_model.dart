import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/core/services/authentication_service.dart';
import 'package:flutterio/core/services/seller_service.dart';
import 'package:flutterio/models/seller.dart';
import 'package:get_it/get_it.dart';
import 'base_model.dart';

class ProductsListModel extends BaseModel {
  final SellerService _db = GetIt.instance<SellerService>();

  final AuthService _authService = getIt<AuthService>();
  User get currentUser => _authService.currentUser;

  Stream<List<Seller>> sellers() {
   // return _db.getProducts();
  }
}
