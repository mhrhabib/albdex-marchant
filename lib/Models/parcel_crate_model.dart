class ParcelCrateModel {
  ParcelCrateModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ParcelCrateModel.fromJson(dynamic json) {
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
      MerchantData? merchant,
      List<Shops>? shops, 
      List<DeliveryCharges>? deliveryCharges, 
      List<CodCharges>? codCharges,
      List<Packagings>? packagings, 
      String? fragileLiquid, 
      List<DeliveryTypes>? deliveryTypes,}){
    _merchant = merchant;
    _shops = shops;
    _deliveryCharges = deliveryCharges;
    _codCharges = codCharges;
    _packagings = packagings;
    _fragileLiquid = fragileLiquid;
    _deliveryTypes = deliveryTypes;
}

  Data.fromJson(dynamic json) {
    _merchant = json['merchant'] != null ? MerchantData.fromJson(json['merchant']) : null;
    if (json['shops'] != null) {
      _shops = [];
      json['shops'].forEach((v) {
        _shops?.add(Shops.fromJson(v));
      });
    }
    if (json['deliveryCharges'] != null && json['deliveryCharges'].length !=0 ) {
      print(json['deliveryCharges']);
      _deliveryCharges = [];
      json['deliveryCharges'].forEach((v) {
        print('object');
        print(v);
          _deliveryCharges?.add(DeliveryCharges.fromJson(v));
      });
    }
    if (json['codCharges'] != null) {
      _codCharges = [];
      json['codCharges'].forEach((v) {
        _codCharges?.add(CodCharges.fromJson(v));
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
  MerchantData? _merchant;
  List<Shops>? _shops;
  List<DeliveryCharges>? _deliveryCharges;
  List<CodCharges>? _codCharges;
  List<Packagings>? _packagings;
  String? _fragileLiquid;
  List<DeliveryTypes>? _deliveryTypes;

  MerchantData? get merchant => _merchant;
  List<Shops>? get shops => _shops;
  List<DeliveryCharges>? get deliveryCharges => _deliveryCharges;
  List<CodCharges>? get codCharges => _codCharges;
  List<Packagings>? get packagings => _packagings;
  String? get fragileLiquid => _fragileLiquid;
  List<DeliveryTypes>? get deliveryTypes => _deliveryTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_merchant != null) {
      map['merchant'] = _merchant?.toJson();
    }
    if (_shops != null) {
      map['shops'] = _shops?.map((v) => v.toJson()).toList();
    }
    if (_deliveryCharges != null) {
      map['deliveryCharges'] = _deliveryCharges?.map((v) => v.toJson()).toList();
    }
    if (_codCharges != null) {
      map['codCharges'] = _codCharges?.map((v) => v.toJson()).toList();
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
      String? value,}){
    _id = id;
    _key = key;
    _value = value;
}

  DeliveryTypes.fromJson(dynamic json) {
    _id = json['id'];
    _key = json['key'];
    _value = json['value'];
  }
  int? _id;
  String? _key;
  String? _value;

  int? get id => _id;
  String? get key => _key;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['key'] = _key;
    map['value'] = _value;
    return map;
  }

}

class Packagings {
  Packagings({
      int? id, 
      String? name, 
      String? price,}){
    _id = id;
    _name = name;
    _price = price;
}

  Packagings.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
  }
  int? _id;
  String? _name;
  String? _price;

  int? get id => _id;
  String? get name => _name;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    return map;
  }

}

class CodChargesData {
  CodChargesData({
      String? name, 
      String? charge,}){
    _name = name;
    _charge = charge;
}

  CodChargesData.fromJson(dynamic json) {
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

class Shops {
  Shops({
      int? id, 
      String? merchantId, 
      String? name, 
      String? contactNo, 
      String? address, 
      String? status, 
      String? defaultShop,}){
    _id = id;
    _merchantId = merchantId;
    _name = name;
    _contactNo = contactNo;
    _address = address;
    _status = status;
    _defaultShop = defaultShop;
}

  Shops.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'].toString();
    _name = json['name'];
    _contactNo = json['contact_no'];
    _address = json['address'];
    _status = json['status'].toString();
    _defaultShop = json['default_shop'].toString();
  }
  int? _id;
  String? _merchantId;
  String? _name;
  String? _contactNo;
  String? _address;
  String? _status;
  String? _defaultShop;

  int? get id => _id;
  String? get merchantId => _merchantId;
  String? get name => _name;
  String? get contactNo => _contactNo;
  String? get address => _address;
  String? get status => _status;
  String? get defaultShop => _defaultShop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
    map['name'] = _name;
    map['contact_no'] = _contactNo;
    map['address'] = _address;
    map['status'] = _status;
    map['default_shop'] = _defaultShop;
    return map;
  }

}

class MerchantData {
  MerchantData({
      int? id, 
      String? userId, 
      String? businessName, 
      String? merchantUniqueId, 
      String? currentBalance, 
      String? openingBalance, 
      String? vat,
    CodCharges? codCharges,
      String? status, 
      String? address,}){
    _id = id;
    _userId = userId;
    _businessName = businessName;
    _merchantUniqueId = merchantUniqueId;
    _currentBalance = currentBalance;
    _openingBalance = openingBalance;
    _vat = vat;
    _codCharges = codCharges;
    _status = status;
    _address = address;
}

  MerchantData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _businessName = json['business_name'];
    _merchantUniqueId = json['merchant_unique_id'];
    _currentBalance = json['current_balance'];
    _openingBalance = json['opening_balance'];
    _vat = json['vat'];
    _codCharges = json['cod_charges'] != null ? CodCharges.fromJson(json['cod_charges']) : null;
    _status = json['status'].toString();
    _address = json['address'];
  }
  int? _id;
  String? _userId;
  String? _businessName;
  String? _merchantUniqueId;
  String? _currentBalance;
  String? _openingBalance;
  String? _vat;
  CodCharges? _codCharges;
  String? _status;
  String? _address;

  int? get id => _id;
  String? get userId => _userId;
  String? get businessName => _businessName;
  String? get merchantUniqueId => _merchantUniqueId;
  String? get currentBalance => _currentBalance;
  String? get openingBalance => _openingBalance;
  String? get vat => _vat;
  CodCharges? get codCharges => _codCharges;
  String? get status => _status;
  String? get address => _address;

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
    map['status'] = _status;
    map['address'] = _address;
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