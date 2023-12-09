class EditParcelModel {
  EditParcelModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  EditParcelModel.fromJson(dynamic json) {
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
      ParcelEdit? parcel,
      MerchantEdit? merchant,
      List<Shops>? shops, 
      List<EditCodCharges>? editCodCharges, 
      List<DeliveryCharges>? deliveryCharges, 
      List<Packagings>? packagings, 
      String? fragileLiquid, 
      List<DeliveryTypes>? deliveryTypes,}){
    _parcel = parcel;
    _merchant = merchant;
    _shops = shops;
    _editCodCharges = editCodCharges;
    _deliveryCharges = deliveryCharges;
    _packagings = packagings;
    _fragileLiquid = fragileLiquid;
    _deliveryTypes = deliveryTypes;
}

  Data.fromJson(dynamic json) {
    _parcel = json['parcel'] != null ? ParcelEdit.fromJson(json['parcel']) : null;
    _merchant = json['merchant'] != null ? MerchantEdit.fromJson(json['merchant']) : null;
    if (json['shops'] != null) {
      _shops = [];
      json['shops'].forEach((v) {
        _shops?.add(Shops.fromJson(v));
      });
    }
    if (json['editCodCharges'] != null) {
      _editCodCharges = [];
      json['editCodCharges'].forEach((v) {
        _editCodCharges?.add(EditCodCharges.fromJson(v));
      });
    }
    if (json['deliveryCharges'] != null) {
      _deliveryCharges = [];
      json['deliveryCharges'].forEach((v) {
        _deliveryCharges?.add(DeliveryCharges.fromJson(v));
      });
    }
    if (json['packagings'] != null) {
      _packagings = [];
      json['packagings'].forEach((v) {
        _packagings?.add(Packagings.fromJson(v));
      });
    }
    _fragileLiquid = json['fragileLiquid'];
    if (json['deliveryTypes'] != null) {
      _deliveryTypes = [];
      json['deliveryTypes'].forEach((v) {
        _deliveryTypes?.add(DeliveryTypes.fromJson(v));
      });
    }
  }
  ParcelEdit? _parcel;
  MerchantEdit? _merchant;
  List<Shops>? _shops;
  List<EditCodCharges>? _editCodCharges;
  List<DeliveryCharges>? _deliveryCharges;
  List<Packagings>? _packagings;
  String? _fragileLiquid;
  List<DeliveryTypes>? _deliveryTypes;

  ParcelEdit? get parcel => _parcel;
  MerchantEdit? get merchant => _merchant;
  List<Shops>? get shops => _shops;
  List<EditCodCharges>? get editCodCharges => _editCodCharges;
  List<DeliveryCharges>? get deliveryCharges => _deliveryCharges;
  List<Packagings>? get packagings => _packagings;
  String? get fragileLiquid => _fragileLiquid;
  List<DeliveryTypes>? get deliveryTypes => _deliveryTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_parcel != null) {
      map['parcel'] = _parcel?.toJson();
    }
    if (_merchant != null) {
      map['merchant'] = _merchant?.toJson();
    }
    if (_shops != null) {
      map['shops'] = _shops?.map((v) => v.toJson()).toList();
    }
    if (_editCodCharges != null) {
      map['editCodCharges'] = _editCodCharges?.map((v) => v.toJson()).toList();
    }
    if (_deliveryCharges != null) {
      map['deliveryCharges'] = _deliveryCharges?.map((v) => v.toJson()).toList();
    }
    if (_packagings != null) {
      map['packagings'] = _packagings?.map((v) => v.toJson()).toList();
    }
    map['fragileLiquid'] = _fragileLiquid;
    if (_deliveryTypes != null) {
      map['deliveryTypes'] = _deliveryTypes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DeliveryTypes {
  DeliveryTypes({
      int? id, 
      String? key, 
      String? value, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _key = key;
    _value = value;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DeliveryTypes.fromJson(dynamic json) {
    _id = json['id'];
    _key = json['key'];
    _value = json['value'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _key;
  String? _value;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get key => _key;
  String? get value => _value;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['key'] = _key;
    map['value'] = _value;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Packagings {
  Packagings({
      int? id, 
      String? name, 
      String? price, 
      String? status, 
      String? position, 
      dynamic photo, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _price = price;
    _status = status;
    _position = position;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Packagings.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _status = json['status'].toString();
    _position = json['position'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _price;
  String? _status;
  String? _position;
  dynamic _photo;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get price => _price;
  String? get status => _status;
  String? get position => _position;
  dynamic get photo => _photo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['status'] = _status;
    map['position'] = _position;
    map['photo'] = _photo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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

class EditCodCharges {
  EditCodCharges({
      String? name, 
      String? charge,}){
    _name = name;
    _charge = charge;
}

  EditCodCharges.fromJson(dynamic json) {
    _name = json['name'];
    _charge = json['charge'];
  }
  String? _name;
  String? _charge;

  String? get name => _name;
  String? get charge => _charge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['charge'] = _charge;
    return map;
  }

}

class Shops {
  Shops({
      int? id, 
      String? merchantId, 
      String? name, 
      String? contactNo, 
      String? address, 
      String? status, 
      String? defaultShop, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _merchantId = merchantId;
    _name = name;
    _contactNo = contactNo;
    _address = address;
    _status = status;
    _defaultShop = defaultShop;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Shops.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'].toString();
    _name = json['name'];
    _contactNo = json['contact_no'];
    _address = json['address'];
    _status = json['status'].toString();
    _defaultShop = json['default_shop'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _merchantId;
  String? _name;
  String? _contactNo;
  String? _address;
  String? _status;
  String? _defaultShop;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get merchantId => _merchantId;
  String? get name => _name;
  String? get contactNo => _contactNo;
  String? get address => _address;
  String? get status => _status;
  String? get defaultShop => _defaultShop;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
    map['name'] = _name;
    map['contact_no'] = _contactNo;
    map['address'] = _address;
    map['status'] = _status;
    map['default_shop'] = _defaultShop;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class MerchantEdit {
  MerchantEdit({
      int? id, 
      String? userId, 
      String? businessName, 
      String? merchantUniqueId, 
      String? currentBalance, 
      String? openingBalance, 
      String? vat, 
      CodCharges? codCharges, 
      dynamic nidId, 
      dynamic tradeLicense, 
      String? status, 
      String? address, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _businessName = businessName;
    _merchantUniqueId = merchantUniqueId;
    _currentBalance = currentBalance;
    _openingBalance = openingBalance;
    _vat = vat;
    _codCharges = codCharges;
    _nidId = nidId;
    _tradeLicense = tradeLicense;
    _status = status;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  MerchantEdit.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _businessName = json['business_name'];
    _merchantUniqueId = json['merchant_unique_id'];
    _currentBalance = json['current_balance'];
    _openingBalance = json['opening_balance'];
    _vat = json['vat'];
    _codCharges = json['cod_charges'] != null ? CodCharges.fromJson(json['cod_charges']) : null;
    _nidId = json['nid_id'];
    _tradeLicense = json['trade_license'];
    _status = json['status'].toString();
    _address = json['address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _userId;
  String? _businessName;
  String? _merchantUniqueId;
  String? _currentBalance;
  String? _openingBalance;
  String? _vat;
  CodCharges? _codCharges;
  dynamic _nidId;
  dynamic _tradeLicense;
  String? _status;
  String? _address;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get businessName => _businessName;
  String? get merchantUniqueId => _merchantUniqueId;
  String? get currentBalance => _currentBalance;
  String? get openingBalance => _openingBalance;
  String? get vat => _vat;
  CodCharges? get codCharges => _codCharges;
  dynamic get nidId => _nidId;
  dynamic get tradeLicense => _tradeLicense;
  String? get status => _status;
  String? get address => _address;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['business_name'] = _businessName;
    map['merchant_unique_id'] = _merchantUniqueId;
    map['current_balance'] = _currentBalance;
    map['opening_balance'] = _openingBalance;
    map['vat'] = _vat;
    if (_codCharges != null) {
      map['cod_charges'] = _codCharges?.toJson();
    }
    map['nid_id'] = _nidId;
    map['trade_license'] = _tradeLicense;
    map['status'] = _status;
    map['address'] = _address;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class CodCharges {
  CodCharges({
      String? insideCity, 
      String? subCity, 
      String? outsideCity,}){
    _insideCity = insideCity;
    _subCity = subCity;
    _outsideCity = outsideCity;
}

  CodCharges.fromJson(dynamic json) {
    _insideCity = json['inside_city'];
    _subCity = json['sub_city'];
    _outsideCity = json['outside_city'];
  }
  String? _insideCity;
  String? _subCity;
  String? _outsideCity;

  String? get insideCity => _insideCity;
  String? get subCity => _subCity;
  String? get outsideCity => _outsideCity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['inside_city'] = _insideCity;
    map['sub_city'] = _subCity;
    map['outside_city'] = _outsideCity;
    return map;
  }

}

class ParcelEdit {
  ParcelEdit({
      int? id, 
      String? merchantId, 
      String? merchantShopId, 
      String? pickupAddress, 
      String? pickupPhone, 
      String? customerName, 
      String? customerPhone, 
      String? customerAddress, 
      String? invoiceNo, 
      String? categoryId, 
      String? weight, 
      String? deliveryTypeId, 
      String? packagingId, 
      dynamic firstHubId, 
      dynamic hubId, 
      dynamic transferHubId, 
      String? cashCollection, 
      dynamic oldCashCollection, 
      String? sellingPrice, 
      String? liquidFragileAmount, 
      String? packagingAmount, 
      String? deliveryCharge, 
      String? codCharge, 
      String? codAmount, 
      String? vat, 
      String? vatAmount, 
      String? totalDeliveryAmount, 
      String? currentPayable, 
      String? trackingId, 
      String? note, 
      String? partialDelivered, 
      String? status, 
      dynamic parcelBank, 
      String? pickupDate, 
      String? deliveryDate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _merchantId = merchantId;
    _merchantShopId = merchantShopId;
    _pickupAddress = pickupAddress;
    _pickupPhone = pickupPhone;
    _customerName = customerName;
    _customerPhone = customerPhone;
    _customerAddress = customerAddress;
    _invoiceNo = invoiceNo;
    _categoryId = categoryId;
    _weight = weight;
    _deliveryTypeId = deliveryTypeId;
    _packagingId = packagingId;
    _firstHubId = firstHubId;
    _hubId = hubId;
    _transferHubId = transferHubId;
    _cashCollection = cashCollection;
    _oldCashCollection = oldCashCollection;
    _sellingPrice = sellingPrice;
    _liquidFragileAmount = liquidFragileAmount;
    _packagingAmount = packagingAmount;
    _deliveryCharge = deliveryCharge;
    _codCharge = codCharge;
    _codAmount = codAmount;
    _vat = vat;
    _vatAmount = vatAmount;
    _totalDeliveryAmount = totalDeliveryAmount;
    _currentPayable = currentPayable;
    _trackingId = trackingId;
    _note = note;
    _partialDelivered = partialDelivered;
    _status = status;
    _parcelBank = parcelBank;
    _pickupDate = pickupDate;
    _deliveryDate = deliveryDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ParcelEdit.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'].toString();
    _merchantShopId = json['merchant_shop_id'].toString();
    _pickupAddress = json['pickup_address'];
    _pickupPhone = json['pickup_phone'];
    _customerName = json['customer_name'];
    _customerPhone = json['customer_phone'];
    _customerAddress = json['customer_address'];
    _invoiceNo = json['invoice_no'].toString();
    _categoryId = json['category_id'].toString();
    _weight = json['weight'].toString();
    _deliveryTypeId = json['delivery_type_id'].toString();
    _packagingId = json['packaging_id'].toString();
    _firstHubId = json['first_hub_id'].toString();
    _hubId = json['hub_id'];
    _transferHubId = json['transfer_hub_id'];
    _cashCollection = json['cash_collection'];
    _oldCashCollection = json['old_cash_collection'];
    _sellingPrice = json['selling_price'];
    _liquidFragileAmount = json['liquid_fragile_amount'];
    _packagingAmount = json['packaging_amount'];
    _deliveryCharge = json['delivery_charge'];
    _codCharge = json['cod_charge'].toString();
    _codAmount = json['cod_amount'].toString();
    _vat = json['vat'].toString();
    _vatAmount = json['vat_amount'].toString();
    _totalDeliveryAmount = json['total_delivery_amount'];
    _currentPayable = json['current_payable'];
    _trackingId = json['tracking_id'];
    _note = json['note'];
    _partialDelivered = json['partial_delivered'].toString();
    _status = json['status'].toString();
    _parcelBank = json['parcel_bank'];
    _pickupDate = json['pickup_date'];
    _deliveryDate = json['delivery_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _merchantId;
  String? _merchantShopId;
  String? _pickupAddress;
  String? _pickupPhone;
  String? _customerName;
  String? _customerPhone;
  String? _customerAddress;
  String? _invoiceNo;
  String? _categoryId;
  String? _weight;
  String? _deliveryTypeId;
  String? _packagingId;
  dynamic _firstHubId;
  dynamic _hubId;
  dynamic _transferHubId;
  String? _cashCollection;
  dynamic _oldCashCollection;
  String? _sellingPrice;
  String? _liquidFragileAmount;
  String? _packagingAmount;
  String? _deliveryCharge;
  String? _codCharge;
  String? _codAmount;
  String? _vat;
  String? _vatAmount;
  String? _totalDeliveryAmount;
  String? _currentPayable;
  String? _trackingId;
  String? _note;
  String? _partialDelivered;
  String? _status;
  dynamic _parcelBank;
  String? _pickupDate;
  String? _deliveryDate;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get merchantId => _merchantId;
  String? get merchantShopId => _merchantShopId;
  String? get pickupAddress => _pickupAddress;
  String? get pickupPhone => _pickupPhone;
  String? get customerName => _customerName;
  String? get customerPhone => _customerPhone;
  String? get customerAddress => _customerAddress;
  String? get invoiceNo => _invoiceNo;
  String? get categoryId => _categoryId;
  String? get weight => _weight;
  String? get deliveryTypeId => _deliveryTypeId;
  String? get packagingId => _packagingId;
  dynamic get firstHubId => _firstHubId;
  dynamic get hubId => _hubId;
  dynamic get transferHubId => _transferHubId;
  String? get cashCollection => _cashCollection;
  dynamic get oldCashCollection => _oldCashCollection;
  String? get sellingPrice => _sellingPrice;
  String? get liquidFragileAmount => _liquidFragileAmount;
  String? get packagingAmount => _packagingAmount;
  String? get deliveryCharge => _deliveryCharge;
  String? get codCharge => _codCharge;
  String? get codAmount => _codAmount;
  String? get vat => _vat;
  String? get vatAmount => _vatAmount;
  String? get totalDeliveryAmount => _totalDeliveryAmount;
  String? get currentPayable => _currentPayable;
  String? get trackingId => _trackingId;
  String? get note => _note;
  String? get partialDelivered => _partialDelivered;
  String? get status => _status;
  dynamic get parcelBank => _parcelBank;
  String? get pickupDate => _pickupDate;
  String? get deliveryDate => _deliveryDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
    map['merchant_shop_id'] = _merchantShopId;
    map['pickup_address'] = _pickupAddress;
    map['pickup_phone'] = _pickupPhone;
    map['customer_name'] = _customerName;
    map['customer_phone'] = _customerPhone;
    map['customer_address'] = _customerAddress;
    map['invoice_no'] = _invoiceNo;
    map['category_id'] = _categoryId;
    map['weight'] = _weight;
    map['delivery_type_id'] = _deliveryTypeId;
    map['packaging_id'] = _packagingId;
    map['first_hub_id'] = _firstHubId;
    map['hub_id'] = _hubId;
    map['transfer_hub_id'] = _transferHubId;
    map['cash_collection'] = _cashCollection;
    map['old_cash_collection'] = _oldCashCollection;
    map['selling_price'] = _sellingPrice;
    map['liquid_fragile_amount'] = _liquidFragileAmount;
    map['packaging_amount'] = _packagingAmount;
    map['delivery_charge'] = _deliveryCharge;
    map['cod_charge'] = _codCharge;
    map['cod_amount'] = _codAmount;
    map['vat'] = _vat;
    map['vat_amount'] = _vatAmount;
    map['total_delivery_amount'] = _totalDeliveryAmount;
    map['current_payable'] = _currentPayable;
    map['tracking_id'] = _trackingId;
    map['note'] = _note;
    map['partial_delivered'] = _partialDelivered;
    map['status'] = _status;
    map['parcel_bank'] = _parcelBank;
    map['pickup_date'] = _pickupDate;
    map['delivery_date'] = _deliveryDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}