class DashboardModel {
  DashboardModel({
      bool? success, 
      String? message, 
      DataDashboard? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  DashboardModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? DataDashboard.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  DataDashboard? _data;

  bool? get success => _success;
  String? get message => _message;
  DataDashboard? get data => _data;

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

class DataDashboard {
  DataDashboard({
      int? tParcel, 
      int? tDelivered, 
      int? tReturn, 
      String? tSale, 
      String? tDeliveryFee,
    double? tBalanceProc,
    double? tBalancePaid,
      int? tRequest, 
      Merchant? merchant, 
      int? tFraud, 
      int? tShop, 
      int? tParcelBank,
      double? tCashCollection,
      double? tSellingPrice,
      double? tLiquidFragile,
      double? tVatAmount,
      double? tDeliveryCharge,
      double? tCodAmount,
      double? tPackaging,
      double? tDeliveryAmount,
      double? tCurrentPayable, 
      List<String>? dates, 
      List<int>? totals, 
      List<int>? pendings, 
      List<int>? delivers, 
      List<int>? parDelivers, 
      List<int>? returns,}){
    _tParcel = tParcel;
    _tDelivered = tDelivered;
    _tReturn = tReturn;
    _tSale = tSale;
    _tDeliveryFee = tDeliveryFee;
    _tBalanceProc = tBalanceProc;
    _tBalancePaid = tBalancePaid;
    _tRequest = tRequest;
    _merchant = merchant;
    _tFraud = tFraud;
    _tShop = tShop;
    _tParcelBank = tParcelBank;
    _tCashCollection = tCashCollection;
    _tSellingPrice = tSellingPrice;
    _tLiquidFragile = tLiquidFragile;
    _tVatAmount = tVatAmount;
    _tDeliveryCharge = tDeliveryCharge;
    _tCodAmount = tCodAmount;
    _tPackaging = tPackaging;
    _tDeliveryAmount = tDeliveryAmount;
    _tCurrentPayable = tCurrentPayable;
    _dates = dates;
    _totals = totals;
    _pendings = pendings;
    _delivers = delivers;
    _parDelivers = parDelivers;
    _returns = returns;
}

  DataDashboard.fromJson(dynamic json) {
    _tParcel = json['t_parcel'];
    _tDelivered = json['t_delivered'];
    _tReturn = json['t_return'];
    _tSale = json['t_sale'].toString();
    _tDeliveryFee = json['t_delivery_fee'].toString();
    _tBalanceProc = double.parse(json['t_balance_proc'].toString());
    _tBalancePaid = double.parse(json['t_balance_paid'].toString());
    _tRequest = int.parse(json['t_request'].toString());
    _merchant = json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
    _tFraud = json['t_fraud'];
    _tShop = json['t_shop'];
    _tParcelBank = json['t_parcel_bank'];
    _tCashCollection = double.parse(json['t_cash_collection'].toString());
    _tSellingPrice = double.parse(json['t_selling_price'].toString());
    _tLiquidFragile = double.parse(json['t_liquid_fragile'].toString());
    _tVatAmount = double.parse(json['t_vat_amount'].toString());
    _tDeliveryCharge = double.parse(json['t_delivery_charge'].toString());
    _tCodAmount = double.parse(json['t_cod_amount'].toString());
    _tPackaging = double.parse(json['t_packaging'].toString());
    _tDeliveryAmount = double.parse(json['t_delivery_amount'].toString());
    _tCurrentPayable = double.parse(json['t_current_payable'].toString());
    _dates = json['dates'] != null ? json['dates'].cast<String>() : [];
    _totals = json['totals'] != null ? json['totals'].cast<int>() : [];
    _pendings = json['pendings'] != null ? json['pendings'].cast<int>() : [];
    _delivers = json['delivers'] != null ? json['delivers'].cast<int>() : [];
    _parDelivers = json['par_delivers'] != null ? json['par_delivers'].cast<int>() : [];
    _returns = json['returns'] != null ? json['returns'].cast<int>() : [];
  }
  int? _tParcel;
  int? _tDelivered;
  int? _tReturn;
  String? _tSale;
  String? _tDeliveryFee;
  double? _tBalanceProc;
  double? _tBalancePaid;
  int? _tRequest;
  Merchant? _merchant;
  int? _tFraud;
  int? _tShop;
  int? _tParcelBank;
  double? _tCashCollection;
  double? _tSellingPrice;
  double? _tLiquidFragile;
  double? _tVatAmount;
  double? _tDeliveryCharge;
  double? _tCodAmount;
  double? _tPackaging;
  double? _tDeliveryAmount;
  double? _tCurrentPayable;
  List<String>? _dates;
  List<int>? _totals;
  List<int>? _pendings;
  List<int>? _delivers;
  List<int>? _parDelivers;
  List<int>? _returns;

  int? get tParcel => _tParcel;
  int? get tDelivered => _tDelivered;
  int? get tReturn => _tReturn;
  String? get tSale => _tSale;
  String? get tDeliveryFee => _tDeliveryFee;
  double? get tBalanceProc => _tBalanceProc;
  double? get tBalancePaid => _tBalancePaid;
  int? get tRequest => _tRequest;
  Merchant? get merchant => _merchant;
  int? get tFraud => _tFraud;
  int? get tShop => _tShop;
  int? get tParcelBank => _tParcelBank;
  double? get tCashCollection => _tCashCollection;
  double? get tSellingPrice => _tSellingPrice;
  double? get tLiquidFragile => _tLiquidFragile;
  double? get tVatAmount => _tVatAmount;
  double? get tDeliveryCharge => _tDeliveryCharge;
  double? get tCodAmount => _tCodAmount;
  double? get tPackaging => _tPackaging;
  double? get tDeliveryAmount => _tDeliveryAmount;
  double? get tCurrentPayable => _tCurrentPayable;
  List<String>? get dates => _dates;
  List<int>? get totals => _totals;
  List<int>? get pendings => _pendings;
  List<int>? get delivers => _delivers;
  List<int>? get parDelivers => _parDelivers;
  List<int>? get returns => _returns;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['t_parcel'] = _tParcel;
    map['t_delivered'] = _tDelivered;
    map['t_return'] = _tReturn;
    map['t_sale'] = _tSale;
    map['t_delivery_fee'] = _tDeliveryFee;
    map['t_balance_proc'] = _tBalanceProc;
    map['t_balance_paid'] = _tBalancePaid;
    map['t_request'] = _tRequest;
    if (_merchant != null) {
      map['merchant'] = _merchant?.toJson();
    }
    map['t_fraud'] = _tFraud;
    map['t_shop'] = _tShop;
    map['t_parcel_bank'] = _tParcelBank;
    map['t_cash_collection'] = _tCashCollection;
    map['t_selling_price'] = _tSellingPrice;
    map['t_liquid_fragile'] = _tLiquidFragile;
    map['t_vat_amount'] = _tVatAmount;
    map['t_delivery_charge'] = _tDeliveryCharge;
    map['t_cod_amount'] = _tCodAmount;
    map['t_packaging'] = _tPackaging;
    map['t_delivery_amount'] = _tDeliveryAmount;
    map['t_current_payable'] = _tCurrentPayable;
    map['dates'] = _dates;
    map['totals'] = _totals;
    map['pendings'] = _pendings;
    map['delivers'] = _delivers;
    map['par_delivers'] = _parDelivers;
    map['returns'] = _returns;
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