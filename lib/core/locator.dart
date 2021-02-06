import 'package:flutterio/core/services/navigator_service.dart';
import 'package:flutterio/core/services/storage_service.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:get_it/get_it.dart';

import 'services/authentication_service.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => StorageService());

  getIt.registerFactory(() => LoginModel());
  getIt.registerFactory(() => ProductModel());
}
