class Product {
  String id;
  String name;
  String image;
  int price;

  Product({this.id, this.name, this.image, this.price});
  fromMap(Map<String, dynamic> map){
    this.id = "0";
    this.name = map["NAME"];
    this.image = map["IMAGE"];
    this.price = map["PRICE"];
  }
}
