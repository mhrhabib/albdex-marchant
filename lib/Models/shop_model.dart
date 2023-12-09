class ShopModel {
  ShopModel({
      bool? success, 
      String? message, 
      DataShop? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ShopModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? DataShop.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  DataShop? _data;

  bool? get success => _success;
  String? get message => _message;
  DataShop? get data => _data;

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

class DataShop {
  DataShop({
      List<ShopsData>? shops,}){
    _shops = shops;
}

  DataShop.fromJson(dynamic json) {
    if (json['shops'] != null) {
      _shops = [];
      json['shops'].forEach((v) {
        _shops?.add(ShopsData.fromJson(v));
      });
    }
  }
  List<ShopsData>? _shops;

  List<ShopsData>? get shops => _shops;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_shops != null) {
      map['shops'] = _shops?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ShopsData {
  ShopsData({
      int? id, 
      String? merchantId, 
      String? name, 
      String? contactNo, 
      String? address, 
      String? defaultShop, 
      int? status, 
      String? statusName, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _merchantId = merchantId;
    _name = name;
    _contactNo = contactNo;
    _address = address;
    _defaultShop = defaultShop;
    _status = status;
    _statusName = statusName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ShopsData.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'].toString();
    _name = json['name'];
    _contactNo = json['contact_no'];
    _address = json['address'];
    _defaultShop = json['default_shop'].toString();
    _status = json['status'];
    _statusName = json['statusName'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _merchantId;
  String? _name;
  String? _contactNo;
  String? _address;
  String? _defaultShop;
  int? _status;
  String? _statusName;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get merchantId => _merchantId;
  String? get name => _name;
  String? get contactNo => _contactNo;
  String? get address => _address;
  String? get defaultShop => _defaultShop;
  int? get status => _status;
  String? get statusName => _statusName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
    map['name'] = _name;
    map['contact_no'] = _contactNo;
    map['address'] = _address;
    map['default_shop'] = _defaultShop;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}