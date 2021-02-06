import 'package:flutterio/views/seller/product.dart';

import 'base_model.dart';

class ProductModel extends BaseModel {
  Future<void> navigateToContacts() {
    return navigatorService.navigateTo(ProductScreen());
  }
}
