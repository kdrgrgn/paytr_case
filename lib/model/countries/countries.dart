
class Countries {
  Map<String,dynamic>? data;

  Countries({this.data});

  Countries.fromJson(Map<String, dynamic> json) {
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}

