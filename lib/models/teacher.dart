class Teacher {
  String id;
  String name;
  String school;

  Teacher({this.id, this.name, this.school});
  fromMap(Map<String, dynamic> map){
    this.id = "0";
    this.name = map["NAME"];
    this.school = map["SCHOOL"];
  }
}
