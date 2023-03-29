class CountryDetail {
  Name? name;
  Map<String, Currencies>? currencies;
  String? region;
  String? flag;

  CountryDetail({this.name, this.currencies, this.region, this.flag});

  CountryDetail.fromJson(Map<String, dynamic> json) {
    name = json["name"] == null ? null : Name.fromJson(json["name"]);

    currencies = json["currencies"];
    if (currencies != null) {
      currencies![currencies!.keys.first] = Currencies.fromJson(
          (json["currencies"] as Map<String, dynamic>)[currencies!.keys.first]);
    }
    region = json["region"];
    flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (name != null) {
      _data["name"] = name?.toJson();
    }
    if (currencies != null) {
      _data["currencies"] = currencies;
    }
    _data["region"] = region;
    _data["flag"] = flag;
    return _data;
  }
}

class Currencies {
  String? name;
  String? symbol;

  Currencies({this.name, this.symbol});

  Currencies.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    symbol = json["symbol"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["symbol"] = symbol;
    return _data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json["common"];
    official = json["official"];
    nativeName = json["nativeName"] == null
        ? null
        : NativeName.fromJson(json["nativeName"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["common"] = common;
    _data["official"] = official;
    if (nativeName != null) {
      _data["nativeName"] = nativeName?.toJson();
    }
    return _data;
  }
}

class NativeName {
  Tur? tur;

  NativeName({this.tur});

  NativeName.fromJson(Map<String, dynamic> json) {
    tur = json["tur"] == null ? null : Tur.fromJson(json["tur"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (tur != null) {
      _data["tur"] = tur?.toJson();
    }
    return _data;
  }
}

class Tur {
  String? official;
  String? common;

  Tur({this.official, this.common});

  Tur.fromJson(Map<String, dynamic> json) {
    official = json["official"];
    common = json["common"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["official"] = official;
    _data["common"] = common;
    return _data;
  }
}
