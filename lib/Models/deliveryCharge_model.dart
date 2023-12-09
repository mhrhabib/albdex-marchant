class DeliveryChargeModel {
  DeliveryChargeModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  DeliveryChargeModel.fromJson(dynamic json) {
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
      List<DeliveryCharges>? deliveryCharges,}){
    _deliveryCharges = deliveryCharges;
}

  Data.fromJson(dynamic json) {
    if (json['deliveryCharges'] != null) {
      _deliveryCharges = [];
      json['deliveryCharges'].forEach((v) {
        _deliveryCharges?.add(DeliveryCharges.fromJson(v));
      });
    }
  }
  List<DeliveryCharges>? _deliveryCharges;

  List<DeliveryCharges>? get deliveryCharges => _deliveryCharges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_deliveryCharges != null) {
      map['deliveryCharges'] = _deliveryCharges?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DeliveryCharges {
  DeliveryCharges({
      int? id, 
      String? merchantId, 
      String? categoryId, 
      String? deliveryChargeId, 
      String? category, 
      String? weight, 
      String? sameDay, 
      String? nextDay, 
      String? subCity, 
      String? outsideCity, 
      String? status, 
      String? statusName,}){
    _id = id;
    _merchantId = merchantId;
    _categoryId = categoryId;
    _deliveryChargeId = deliveryChargeId;
    _category = category;
    _weight = weight;
    _sameDay = sameDay;
    _nextDay = nextDay;
    _subCity = subCity;
    _outsideCity = outsideCity;
    _status = status;
    _statusName = statusName;
}

  DeliveryCharges.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'].toString();
    _categoryId = json['category_id'].toString();
    _deliveryChargeId = json['delivery_charge_id'].toString();
    _category = json['category'];
    _weight = json['weight'].toString();
    _sameDay = json['same_day'];
    _nextDay = json['next_day'];
    _subCity = json['sub_city'];
    _outsideCity = json['outside_city'];
    _status = json['status'].toString();
    _statusName = json['statusName'];
  }
  int? _id;
  String? _merchantId;
  String? _categoryId;
  String? _deliveryChargeId;
  String? _category;
  String? _weight;
  String? _sameDay;
  String? _nextDay;
  String? _subCity;
  String? _outsideCity;
  String? _status;
  String? _statusName;

  int? get id => _id;
  String? get merchantId => _merchantId;
  String? get categoryId => _categoryId;
  String? get deliveryChargeId => _deliveryChargeId;
  String? get category => _category;
  String? get weight => _weight;
  String? get sameDay => _sameDay;
  String? get nextDay => _nextDay;
  String? get subCity => _subCity;
  String? get outsideCity => _outsideCity;
  String? get status => _status;
  String? get statusName => _statusName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
    map['category_id'] = _categoryId;
    map['delivery_charge_id'] = _deliveryChargeId;
    map['category'] = _category;
    map['weight'] = _weight;
    map['same_day'] = _sameDay;
    map['next_day'] = _nextDay;
    map['sub_city'] = _subCity;
    map['outside_city'] = _outsideCity;
    map['status'] = _status;
    map['statusName'] = _statusName;
    return map;
  }

}