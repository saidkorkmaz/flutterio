import '../../globals.dart';

class CartService {
  addCart(String name, String image, double price){
    print("Add cart : $name");
    if(cart == null)
      cart = List();
    cart.add({"NAME":name, "IMAGE":image, "PRICE":price});
    print(cart);
  }
}