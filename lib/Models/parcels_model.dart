class ParcelsModel {
  ParcelsModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ParcelsModel.fromJson(dynamic json) {
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
      List<Parcels>? parcels,}){
    _parcels = parcels;
}

  Data.fromJson(dynamic json) {
    if (json['parcels'] != null) {
      _parcels = [];
      json['parcels'].forEach((v) {
        _parcels?.add(Parcels.fromJson(v));
      });
    }
  }
  List<Parcels>? _parcels;

  List<Parcels>? get parcels => _parcels;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_parcels != null) {
      map['parcels'] = _parcels?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Parcels {
  Parcels({
      int? id, 
      String? trackingId, 
      String? invoiceNO,
      String? merchantId,
      String? merchantName, 
      String? merchantMobile, 
      String? merchantUserName,
      String? merchantUserEmail,
      String? merchantAddress,
      String? customerName, 
      String? customerPhone, 
      String? customerAddress, 
      String? totalDeliveryAmount, 
      String? vatAmount, 
      String? codAmount,
      String? currentPayable,
      String? cashCollection, 
      int? deliveryTypeId, 
      String? deliveryType, 
      String? weight,
      int? status,
      String? statusName, 
      String? pickupDate, 
      String? deliveryDate, 
      String? createdAt, 
      String? updatedAt,
      String? parcelTime,
      String? parcelDate,
  }){
    _id = id;
    _trackingId = trackingId;
    _invoiceNO = invoiceNO;
    _merchantId = merchantId;
    _merchantName = merchantName;
    _merchantUserName = merchantUserName;
    _merchantUserEmail = merchantUserEmail;
    _merchantMobile = merchantMobile;
    _merchantAddress = merchantAddress;
    _customerName = customerName;
    _customerPhone = customerPhone;
    _customerAddress = customerAddress;
    _totalDeliveryAmount = totalDeliveryAmount;
    _vatAmount = vatAmount;
    _codAmount = codAmount;
    _currentPayable = currentPayable;
    _cashCollection = cashCollection;
    _deliveryTypeId = deliveryTypeId;
    _deliveryType = deliveryType;
    _weight = weight;
    _status = status;
    _statusName = statusName;
    _pickupDate = pickupDate;
    _deliveryDate = deliveryDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _parcelTime = parcelTime;
    _parcelDate = parcelDate;
}

  Parcels.fromJson(dynamic json) {
    _id = json['id'];
    _trackingId = json['tracking_id'];
    _invoiceNO = json['invoice_no'];
    _merchantId = json['merchant_id'].toString();
    _merchantName = json['merchant_name'];
    _merchantUserName = json['merchant_user_name'];
    _merchantUserEmail = json['merchant_user_email'];
    _merchantMobile = json['merchant_mobile'];
    _merchantAddress = json['merchant_address'];
    _customerName = json['customer_name'];
    _customerPhone = json['customer_phone'];
    _customerAddress = json['customer_address'];
    _totalDeliveryAmount = json['total_delivery_amount'];
    _codAmount = json['cod_amount'];
    _vatAmount = json['vat_amount'];
    _currentPayable = json['current_payable'];
    _cashCollection = json['cash_collection'];
    _deliveryTypeId = json['delivery_type_id'];
    _deliveryType = json['deliveryType'];
    _weight = json['weight'];
    _status = json['status'];
    _statusName = json['statusName'];
    _pickupDate = json['pickup_date'];
    _deliveryDate = json['delivery_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _parcelTime = json['parcel_time'];
    _parcelDate = json['parcel_date'];
  }
  int? _id;
  String? _trackingId;
  String? _invoiceNO;
  String? _merchantId;
  String? _merchantName;
  String? _merchantUserName;
  String? _merchantUserEmail;
  String? _merchantMobile;
  String? _merchantAddress;
  String? _customerName;
  String? _customerPhone;
  String? _customerAddress;
  String? _totalDeliveryAmount;
  String? _vatAmount;
  String? _codAmount;
  String? _currentPayable;
  String? _cashCollection;
  int? _deliveryTypeId;
  String? _deliveryType;
  String? _weight;
  int? _status;
  String? _statusName;
  String? _pickupDate;
  String? _deliveryDate;
  String? _createdAt;
  String? _updatedAt;
  String? _parcelTime;
  String? _parcelDate;

  int? get id => _id;
  String? get trackingId => _trackingId;
  String? get invoiceNO => _invoiceNO;
  String? get merchantId => _merchantId;
  String? get merchantName => _merchantName;
  String? get merchantUserName => _merchantUserName;
  String? get merchantUserEmail => _merchantUserEmail;
  String? get merchantMobile => _merchantMobile;
  String? get merchantAddress => _merchantAddress;
  String? get customerName => _customerName;
  String? get customerPhone => _customerPhone;
  String? get customerAddress => _customerAddress;
  String? get totalDeliveryAmount => _totalDeliveryAmount;
  String? get vatAmount => _vatAmount;
  String? get codAmount => _codAmount;
  String? get currentPayable => _currentPayable;
  String? get cashCollection => _cashCollection;
  int? get deliveryTypeId => _deliveryTypeId;
  String? get weight => _weight;
  String? get deliveryType => _deliveryType;
  int? get status => _status;
  String? get statusName => _statusName;
  String? get pickupDate => _pickupDate;
  String? get deliveryDate => _deliveryDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get parcelTime => _parcelTime;
  String? get parcelDate => _parcelDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tracking_id'] = _trackingId;
    map['invoice_no'] = _invoiceNO;
    map['merchant_id'] = _merchantId;
    map['merchant_name'] = _merchantName;
    map['merchant_user_name'] = _merchantUserName;
    map['merchant_user_email'] = _merchantUserEmail;
    map['merchant_mobile'] = _merchantMobile;
    map['merchant_address'] = _merchantAddress;
    map['customer_name'] = _customerName;
    map['customer_phone'] = _customerPhone;
    map['customer_address'] = _customerAddress;
    map['total_delivery_amount'] = _totalDeliveryAmount;
    map['vat_amount'] = _vatAmount;
    map['cod_amount'] = _codAmount;
    map['current_payable'] = _currentPayable;
    map['cash_collection'] = _cashCollection;
    map['delivery_type_id'] = _deliveryTypeId;
    map['deliveryType'] = _deliveryType;
    map['weight'] = _weight;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['pickup_date'] = _pickupDate;
    map['delivery_date'] = _deliveryDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['parcel_time'] = _parcelTime;
    map['parcel_date'] = _parcelDate;
    return map;
  }

}