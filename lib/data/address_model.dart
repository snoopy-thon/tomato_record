class AddressModel {
  Page? _page;

  Page? get page => _page;

  set page(Page? value) {
    _page = value;
  }

  Result? _result;

  Result? get result => _result;

  set result(Result? value) {
    _result = value;
  }

  AddressModel({Page? page, Result? result})
      : _result = result,
        _page = page;

  AddressModel.fromJson(Map<String, dynamic> json) {
    _page = json["page"] == null ? null : Page.fromJson(json["page"]);
    _result = json["result"] == null ? null : Result.fromJson(json["result"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_page != null) {
      data["page"] = _page?.toJson();
    }
    if (_result != null) {
      data["result"] = _result?.toJson();
    }
    return data;
  }
}

class Result {
  String? _crs;

  String? get crs => _crs;

  set crs(String? value) {
    _crs = value;
  }

  String? _type;

  String? get type => _type;

  set type(String? value) {
    _type = value;
  }

  List<Items>? _items;

  List<Items>? get items => _items;

  set items(List<Items>? value) {
    _items = value;
  }

  Result({String? crs, String? type, List<Items>? items})
      : _items = items,
        _type = type,
        _crs = crs;

  Result.fromJson(Map<String, dynamic> json) {
    _crs = json["crs"];
    _type = json["type"];
    _items = json["items"] == null
        ? null
        : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["crs"] = _crs;
    data["type"] = _type;
    if (items != null) {
      data["items"] = _items?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? _id;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  Address? _address;

  Address? get address => _address;

  set address(Address? value) {
    _address = value;
  }

  Point? _point;

  Point? get point => _point;

  set point(Point? value) {
    _point = value;
  }

  Items({String? id, Address? address, Point? point})
      : _point = point,
        _address = address,
        _id = id;

  Items.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _address =
        json["address"] == null ? null : Address.fromJson(json["address"]);
    _point = json["point"] == null ? null : Point.fromJson(json["point"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = _id;
    if (_address != null) {
      data["address"] = _address?.toJson();
    }
    if (_point != null) {
      data["point"] = _point?.toJson();
    }
    return data;
  }
}

class Point {
  String? _x;

  String? get x => _x;

  set x(String? value) {
    _x = value;
  }

  String? _y;

  String? get y => _y;

  set y(String? value) {
    _y = value;
  }

  Point({String? x, String? y})
      : _y = y,
        _x = x;

  Point.fromJson(Map<String, dynamic> json) {
    _x = json["x"];
    _y = json["y"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["x"] = _x;
    data["y"] = _y;
    return data;
  }
}

class Address {
  String? _zipcode;

  String? get zipcode => _zipcode;

  set zipcode(String? value) {
    _zipcode = value;
  }

  String? _category;

  String? get category => _category;

  set category(String? value) {
    _category = value;
  }

  String? _road;

  String? get road => _road;

  set road(String? value) {
    _road = value;
  }

  String? _parcel;

  String? get parcel => _parcel;

  set parcel(String? value) {
    _parcel = value;
  }

  String? _bldnm;

  String? get bldnm => _bldnm;

  set bldnm(String? value) {
    _bldnm = value;
  }

  String? _bldnmdc;

  String? get bldnmdc => _bldnmdc;

  set bldnmdc(String? value) {
    _bldnmdc = value;
  }

  Address(
      {String? zipcode,
      String? category,
      String? road,
      String? parcel,
      String? bldnm,
      String? bldnmdc})
      : _bldnmdc = bldnmdc,
        _bldnm = bldnm,
        _parcel = parcel,
        _road = road,
        _category = category,
        _zipcode = zipcode;

  Address.fromJson(Map<String, dynamic> json) {
    _zipcode = json["zipcode"];
    _category = json["category"];
    _road = json["road"];
    _parcel = json["parcel"];
    _bldnm = json["bldnm"];
    _bldnmdc = json["bldnmdc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["zipcode"] = _zipcode;
    data["category"] = _category;
    data["road"] = _road;
    data["parcel"] = _parcel;
    data["bldnm"] = _bldnm;
    data["bldnmdc"] = _bldnmdc;
    return data;
  }
}

class Page {
  String? _total;

  String? get total => _total;

  set total(String? value) {
    _total = value;
  }

  String? _current;

  String? get current => _current;

  set current(String? value) {
    _current = value;
  }

  String? _size;

  String? get size => _size;

  set size(String? value) {
    _size = value;
  }

  Page({String? total, String? current, String? size})
      : _size = size,
        _current = current,
        _total = total;

  Page.fromJson(Map<String, dynamic> json) {
    _total = json["total"];
    _current = json["current"];
    _size = json["size"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = _total;
    data["current"] = _current;
    data["size"] = _size;
    return data;
  }
}
