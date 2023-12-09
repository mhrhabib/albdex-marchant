class HubsModel {
  HubsModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  HubsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      List<Hubs>? hubs,}){
    _hubs = hubs;
}

  Data.fromJson(dynamic json) {
    if (json['hubs'] != null) {
      _hubs = [];
      json['hubs'].forEach((v) {
        _hubs?.add(Hubs.fromJson(v));
      });
    }
  }
  List<Hubs>? _hubs;

  List<Hubs>? get hubs => _hubs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_hubs != null) {
      map['hubs'] = _hubs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Hubs {
  Hubs({
      int? id, 
      String? name, 
      String? phone, 
      String? address,}){
    _id = id;
    _name = name;
    _phone = phone;
    _address = address;
}

  Hubs.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _address = json['address'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _address;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    return map;
  }

}