
class User {
  String? name;
  String? surname;
  String? mail;
  int? age;
  String? userName;

  User({this.name, this.surname, this.mail, this.age, this.userName});

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    surname = json["surname"];
    mail = json["mail"];
    age = json["age"];
    userName = json["userName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["surname"] = surname;
    _data["mail"] = mail;
    _data["age"] = age;
    _data["userName"] = userName;
    return _data;
  }
}