class FraudModel {
  FraudModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  FraudModel.fromJson(dynamic json) {
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
      List<Frauds>? frauds,}){
    _frauds = frauds;
}

  Data.fromJson(dynamic json) {
    if (json['frauds'] != null) {
      _frauds = [];
      json['frauds'].forEach((v) {
        _frauds?.add(Frauds.fromJson(v));
      });
    }
  }
  List<Frauds>? _frauds;

  List<Frauds>? get frauds => _frauds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_frauds != null) {
      map['frauds'] = _frauds?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Frauds {
  Frauds({
      int? id, 
      String? name, 
      String? phone, 
      String? description, 
      String? date,}){
    _id = id;
    _name = name;
    _phone = phone;
    _description = description;
    _date = date;
}

  Frauds.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _description = json['description'];
    _date = json['date'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _description;
  String? _date;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get description => _description;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['description'] = _description;
    map['date'] = _date;
    return map;
  }

}