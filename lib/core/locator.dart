import 'package:flutterio/core/services/cart_service.dart';
import 'package:flutterio/core/services/navigator_service.dart';
import 'package:flutterio/core/services/requirement_service.dart';
import 'package:flutterio/core/services/product_service.dart';
import 'package:flutterio/core/services/storage_service.dart';
import 'package:flutterio/core/services/user_service.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:flutterio/view_models/requirement_model.dart';
import 'package:flutterio/view_models/seller_model.dart';
import 'package:get_it/get_it.dart';

import 'services/authentication_service.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => StorageService());
  getIt.registerLazySingleton(() => UserService());
  getIt.registerLazySingleton(() => ProductService());
  getIt.registerLazySingleton(() => CartService());
  getIt.registerLazySingleton(() => RequirementService());

  getIt.registerFactory(() => LoginModel());
  getIt.registerFactory(() => ProductModel());
  getIt.registerFactory(() => RequirementModel());
  getIt.registerFactory(() => SellerModel());
}
