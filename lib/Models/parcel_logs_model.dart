class ParcelLogsModel {
  ParcelLogsModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ParcelLogsModel.fromJson(dynamic json) {
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
      Parcel? parcel, 
      List<ParcelEvents>? parcelEvents,}){
    _parcel = parcel;
    _parcelEvents = parcelEvents;
}

  Data.fromJson(dynamic json) {
    _parcel = json['parcel'] != null ? Parcel.fromJson(json['parcel']) : null;
    if (json['parcelEvents'] != null) {
      _parcelEvents = [];
      json['parcelEvents'].forEach((v) {
        _parcelEvents?.add(ParcelEvents.fromJson(v));
      });
    }
  }
  Parcel? _parcel;
  List<ParcelEvents>? _parcelEvents;

  Parcel? get parcel => _parcel;
  List<ParcelEvents>? get parcelEvents => _parcelEvents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_parcel != null) {
      map['parcel'] = _parcel?.toJson();
    }
    if (_parcelEvents != null) {
      map['parcelEvents'] = _parcelEvents?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ParcelEvents {
  ParcelEvents({
      int? id, 
      String? hubName, 
      String? hubPhone, 
      String? pickupMan, 
      String? pickupPhone, 
      String? deliveryMan, 
      String? transferDeliveryMan, 
      String? deliveryPhone, 
      String? transferDeliveryPhone, 
      String? description, 
      String? parcelStatus, 
      String? parcelStatusName, 
      String? date, 
      String? timeDate,}){
    _id = id;
    _hubName = hubName;
    _hubPhone = hubPhone;
    _pickupMan = pickupMan;
    _pickupPhone = pickupPhone;
    _deliveryMan = deliveryMan;
    _transferDeliveryMan = transferDeliveryMan;
    _deliveryPhone = deliveryPhone;
    _transferDeliveryPhone = transferDeliveryPhone;
    _description = description;
    _parcelStatus = parcelStatus;
    _parcelStatusName = parcelStatusName;
    _date = date;
    _timeDate = timeDate;
}

  ParcelEvents.fromJson(dynamic json) {
    _id = json['id'];
    _hubName = json['hub_name'];
    _hubPhone = json['hub_phone'];
    _pickupMan = json['pickup_man'];
    _pickupPhone = json['pickup_phone'];
    _deliveryMan = json['delivery_man'];
    _transferDeliveryMan = json['transfer_delivery_man'];
    _deliveryPhone = json['delivery_phone'];
    _transferDeliveryPhone = json['transfer_delivery_phone'];
    _description = json['description'];
    _parcelStatus = json['parcel_status'].toString();
    _parcelStatusName = json['parcel_status_name'];
    _date = json['date'];
    _timeDate = json['time_date'];
  }
  int? _id;
  String? _hubName;
  String? _hubPhone;
  String? _pickupMan;
  String? _pickupPhone;
  String? _deliveryMan;
  String? _transferDeliveryMan;
  String? _deliveryPhone;
  String? _transferDeliveryPhone;
  String? _description;
  String? _parcelStatus;
  String? _parcelStatusName;
  String? _date;
  String? _timeDate;

  int? get id => _id;
  String? get hubName => _hubName;
  String? get hubPhone => _hubPhone;
  String? get pickupMan => _pickupMan;
  String? get pickupPhone => _pickupPhone;
  String? get deliveryMan => _deliveryMan;
  String? get transferDeliveryMan => _transferDeliveryMan;
  String? get deliveryPhone => _deliveryPhone;
  String? get transferDeliveryPhone => _transferDeliveryPhone;
  String? get description => _description;
  String? get parcelStatus => _parcelStatus;
  String? get parcelStatusName => _parcelStatusName;
  String? get date => _date;
  String? get timeDate => _timeDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hub_name'] = _hubName;
    map['hub_phone'] = _hubPhone;
    map['pickup_man'] = _pickupMan;
    map['pickup_phone'] = _pickupPhone;
    map['delivery_man'] = _deliveryMan;
    map['transfer_delivery_man'] = _transferDeliveryMan;
    map['delivery_phone'] = _deliveryPhone;
    map['transfer_delivery_phone'] = _transferDeliveryPhone;
    map['description'] = _description;
    map['parcel_status'] = _parcelStatus;
    map['parcel_status_name'] = _parcelStatusName;
    map['date'] = _date;
    map['time_date'] = _timeDate;
    return map;
  }

}

class Parcel {
  Parcel({
      int? id, 
      String? trackingId, 
      String? merchantId, 
      String? merchantName, 
      String? merchantMobile, 
      String? merchantAddress, 
      String? customerName, 
      String? customerPhone, 
      String? customerAddress, 
      String? totalDeliveryAmount, 
      String? vatAmount, 
      String? currentPayable, 
      String? cashCollection, 
      int? deliveryTypeId, 
      String? deliveryType, 
      int? status, 
      String? statusName, 
      String? pickupDate, 
      String? deliveryDate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _trackingId = trackingId;
    _merchantId = merchantId;
    _merchantName = merchantName;
    _merchantMobile = merchantMobile;
    _merchantAddress = merchantAddress;
    _customerName = customerName;
    _customerPhone = customerPhone;
    _customerAddress = customerAddress;
    _totalDeliveryAmount = totalDeliveryAmount;
    _vatAmount = vatAmount;
    _currentPayable = currentPayable;
    _cashCollection = cashCollection;
    _deliveryTypeId = deliveryTypeId;
    _deliveryType = deliveryType;
    _status = status;
    _statusName = statusName;
    _pickupDate = pickupDate;
    _deliveryDate = deliveryDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Parcel.fromJson(dynamic json) {
    _id = json['id'];
    _trackingId = json['tracking_id'];
    _merchantId = json['merchant_id'].toString();
    _merchantName = json['merchant_name'];
    _merchantMobile = json['merchant_mobile'];
    _merchantAddress = json['merchant_address'];
    _customerName = json['customer_name'];
    _customerPhone = json['customer_phone'];
    _customerAddress = json['customer_address'];
    _totalDeliveryAmount = json['total_delivery_amount'];
    _vatAmount = json['vat_amount'];
    _currentPayable = json['current_payable'];
    _cashCollection = json['cash_collection'];
    _deliveryTypeId = json['delivery_type_id'];
    _deliveryType = json['deliveryType'];
    _status = json['status'];
    _statusName = json['statusName'];
    _pickupDate = json['pickup_date'];
    _deliveryDate = json['delivery_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _trackingId;
  String? _merchantId;
  String? _merchantName;
  String? _merchantMobile;
  String? _merchantAddress;
  String? _customerName;
  String? _customerPhone;
  String? _customerAddress;
  String? _totalDeliveryAmount;
  String? _vatAmount;
  String? _currentPayable;
  String? _cashCollection;
  int? _deliveryTypeId;
  String? _deliveryType;
  int? _status;
  String? _statusName;
  String? _pickupDate;
  String? _deliveryDate;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get trackingId => _trackingId;
  String? get merchantId => _merchantId;
  String? get merchantName => _merchantName;
  String? get merchantMobile => _merchantMobile;
  String? get merchantAddress => _merchantAddress;
  String? get customerName => _customerName;
  String? get customerPhone => _customerPhone;
  String? get customerAddress => _customerAddress;
  String? get totalDeliveryAmount => _totalDeliveryAmount;
  String? get vatAmount => _vatAmount;
  String? get currentPayable => _currentPayable;
  String? get cashCollection => _cashCollection;
  int? get deliveryTypeId => _deliveryTypeId;
  String? get deliveryType => _deliveryType;
  int? get status => _status;
  String? get statusName => _statusName;
  String? get pickupDate => _pickupDate;
  String? get deliveryDate => _deliveryDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tracking_id'] = _trackingId;
    map['merchant_id'] = _merchantId;
    map['merchant_name'] = _merchantName;
    map['merchant_mobile'] = _merchantMobile;
    map['merchant_address'] = _merchantAddress;
    map['customer_name'] = _customerName;
    map['customer_phone'] = _customerPhone;
    map['customer_address'] = _customerAddress;
    map['total_delivery_amount'] = _totalDeliveryAmount;
    map['vat_amount'] = _vatAmount;
    map['current_payable'] = _currentPayable;
    map['cash_collection'] = _cashCollection;
    map['delivery_type_id'] = _deliveryTypeId;
    map['deliveryType'] = _deliveryType;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['pickup_date'] = _pickupDate;
    map['delivery_date'] = _deliveryDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}