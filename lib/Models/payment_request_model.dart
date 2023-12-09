class PaymentRequestModel {
  PaymentRequestModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  PaymentRequestModel.fromJson(dynamic json) {
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

/// payments : [{"id":2,"transaction_id":null,"description":"","amount":"60000.00","currency":"","payment_method":"bank","paymentMethodName":"Bank","bank_name":"Bank Asia Ltd.","holder_name":"Riaz Uddin","account_no":"654654654654654","branch_name":"Mirpur DOHS,Dhaka","routing_no":"3","mobile_company":null,"mobile_no":null,"account_type":null,"status":3,"statusName":"Pending","request_date":"14 Aug 2022, 09:49 AM","created_at":"14 Aug 2022, 09:49 AM","updated_at":"14 Aug 2022, 09:49 AM"}]

class Data {
  Data({
      List<Payments>? payments,}){
    _payments = payments;
}

  Data.fromJson(dynamic json) {
    if (json['payments'] != null) {
      _payments = [];
      json['payments'].forEach((v) {
        _payments?.add(Payments.fromJson(v));
      });
    }
  }
  List<Payments>? _payments;

  List<Payments>? get payments => _payments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_payments != null) {
      map['payments'] = _payments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// transaction_id : null
/// description : ""
/// amount : "60000.00"
/// currency : ""
/// payment_method : "bank"
/// paymentMethodName : "Bank"
/// bank_name : "Bank Asia Ltd."
/// holder_name : "Riaz Uddin"
/// account_no : "654654654654654"
/// branch_name : "Mirpur DOHS,Dhaka"
/// routing_no : "3"
/// mobile_company : null
/// mobile_no : null
/// account_type : null
/// status : 3
/// statusName : "Pending"
/// request_date : "14 Aug 2022, 09:49 AM"
/// created_at : "14 Aug 2022, 09:49 AM"
/// updated_at : "14 Aug 2022, 09:49 AM"

class Payments {
  Payments({
      int? id, 
      dynamic transactionId, 
      String? description, 
      String? amount, 
      String? currency, 
      String? paymentMethod, 
      String? paymentMethodName, 
      String? bankName, 
      String? holderName, 
      String? accountNo, 
      String? branchName, 
      String? routingNo, 
      dynamic mobileCompany, 
      dynamic mobileNo, 
      dynamic accountType, 
      int? status, 
      String? statusName, 
      String? requestDate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _transactionId = transactionId;
    _description = description;
    _amount = amount;
    _currency = currency;
    _paymentMethod = paymentMethod;
    _paymentMethodName = paymentMethodName;
    _bankName = bankName;
    _holderName = holderName;
    _accountNo = accountNo;
    _branchName = branchName;
    _routingNo = routingNo;
    _mobileCompany = mobileCompany;
    _mobileNo = mobileNo;
    _accountType = accountType;
    _status = status;
    _statusName = statusName;
    _requestDate = requestDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Payments.fromJson(dynamic json) {
    _id = json['id'];
    _transactionId = json['transaction_id'];
    _description = json['description'];
    _amount = json['amount'];
    _currency = json['currency'];
    _paymentMethod = json['payment_method'];
    _paymentMethodName = json['paymentMethodName'];
    _bankName = json['bank_name'];
    _holderName = json['holder_name'];
    _accountNo = json['account_no'];
    _branchName = json['branch_name'];
    _routingNo = json['routing_no'];
    _mobileCompany = json['mobile_company'];
    _mobileNo = json['mobile_no'];
    _accountType = json['account_type'];
    _status = json['status'];
    _statusName = json['statusName'];
    _requestDate = json['request_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  dynamic _transactionId;
  String? _description;
  String? _amount;
  String? _currency;
  String? _paymentMethod;
  String? _paymentMethodName;
  String? _bankName;
  String? _holderName;
  String? _accountNo;
  String? _branchName;
  String? _routingNo;
  dynamic _mobileCompany;
  dynamic _mobileNo;
  dynamic _accountType;
  int? _status;
  String? _statusName;
  String? _requestDate;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  dynamic get transactionId => _transactionId;
  String? get description => _description;
  String? get amount => _amount;
  String? get currency => _currency;
  String? get paymentMethod => _paymentMethod;
  String? get paymentMethodName => _paymentMethodName;
  String? get bankName => _bankName;
  String? get holderName => _holderName;
  String? get accountNo => _accountNo;
  String? get branchName => _branchName;
  String? get routingNo => _routingNo;
  dynamic get mobileCompany => _mobileCompany;
  dynamic get mobileNo => _mobileNo;
  dynamic get accountType => _accountType;
  int? get status => _status;
  String? get statusName => _statusName;
  String? get requestDate => _requestDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['transaction_id'] = _transactionId;
    map['description'] = _description;
    map['amount'] = _amount;
    map['currency'] = _currency;
    map['payment_method'] = _paymentMethod;
    map['paymentMethodName'] = _paymentMethodName;
    map['bank_name'] = _bankName;
    map['holder_name'] = _holderName;
    map['account_no'] = _accountNo;
    map['branch_name'] = _branchName;
    map['routing_no'] = _routingNo;
    map['mobile_company'] = _mobileCompany;
    map['mobile_no'] = _mobileNo;
    map['account_type'] = _accountType;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['request_date'] = _requestDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}