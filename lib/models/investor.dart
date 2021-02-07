class Investor {
  String id;
  String name;
  int totalAmount;

  Investor({this.id, this.name, this.totalAmount});
  fromMap(Map<String, dynamic> map, String id){
    this.id = id;
    this.name = map["NAME"];
    this.totalAmount = map["TOTAL_AMOUNT"] ?? 0;
  }
}
