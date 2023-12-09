class LoginModels {
  LoginModels({
      bool? success, 
      String? message, 
      LoginData? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  LoginModels.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  LoginData? _data;

  bool? get success => _success;
  String? get message => _message;
  LoginData? get data => _data;

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

class LoginData {
  LoginData({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  LoginData.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;

  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      int? id, 
      String? name, 
      String? email, 
      String? phone, 
      String? userType, 
      String? hubId, 
      Hub? hub, 
      Merchant? merchant, 
      dynamic joiningDate, 
      String? address, 
      String? salary, 
      String? status, 
      String? statusName, 
      String? image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _userType = userType;
    _hubId = hubId;
    _hub = hub;
    _merchant = merchant;
    _joiningDate = joiningDate;
    _address = address;
    _salary = salary;
    _status = status;
    _statusName = statusName;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _userType = json['user_type'].toString();
    _hubId = json['hub_id'].toString();
    _hub = json['hub'] != null ? Hub.fromJson(json['hub']) : null;
    _merchant = json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
    _joiningDate = json['joining_date'];
    _address = json['address'];
    _salary = json['salary'];
    _status = json['status'].toString();
    _statusName = json['statusName'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _userType;
  String? _hubId;
  Hub? _hub;
  Merchant? _merchant;
  dynamic _joiningDate;
  String? _address;
  String? _salary;
  String? _status;
  String? _statusName;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get userType => _userType;
  String? get hubId => _hubId;
  Hub? get hub => _hub;
  Merchant? get merchant => _merchant;
  dynamic get joiningDate => _joiningDate;
  String? get address => _address;
  String? get salary => _salary;
  String? get status => _status;
  String? get statusName => _statusName;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['user_type'] = _userType;
    map['hub_id'] = _hubId;
    if (_hub != null) {
      map['hub'] = _hub?.toJson();
    }
    if (_merchant != null) {
      map['merchant'] = _merchant?.toJson();
    }
    map['joining_date'] = _joiningDate;
    map['address'] = _address;
    map['salary'] = _salary;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Merchant {
  Merchant({
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

  Merchant.fromJson(dynamic json) {
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

class Hub {
  Hub({
      int? id, 
      String? name, 
      String? phone, 
      String? address, 
      String? currentBalance, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _phone = phone;
    _address = address;
    _currentBalance = currentBalance;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Hub.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _address = json['address'];
    _currentBalance = json['current_balance'];
    _status = json['status'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _address;
  String? _currentBalance;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get address => _address;
  String? get currentBalance => _currentBalance;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    map['current_balance'] = _currentBalance;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}