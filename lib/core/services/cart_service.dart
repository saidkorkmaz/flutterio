import 'package:flutterio/models/product.dart';

import '../../globals.dart';

class CartService {
  addCart(String name, String image, int price){
    print("Add cart : $name");
    if(cart == null)
      cart = List<Product>();
    cart.add(Product(name: name, image: image, price: price));
    print(cart);
  }
}