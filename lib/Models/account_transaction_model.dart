class AccountTransactionModel {
  AccountTransactionModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  AccountTransactionModel.fromJson(dynamic json) {
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

/// accounts : [{"id":12,"merchant_id":"17","payment_method":"bank","paymentMethodName":"Bank","bank_name":"Bank Asia Ltd.","holder_name":"Riaz Uddin","account_no":"654654654654654","branch_name":"Mirpur DOHS,Dhaka","routing_no":"3","mobile_company":null,"mobile_no":null,"account_type":null,"status":1,"statusName":"Active","created_at":"03 Jul 2022, 10:46 AM","updated_at":"03 Jul 2022, 10:46 AM"},{"id":21,"merchant_id":"17","payment_method":"bank","paymentMethodName":"Bank","bank_name":"bank name","holder_name":"holder name","account_no":"4567897654","branch_name":"mirpur","routing_no":"455","mobile_company":null,"mobile_no":null,"account_type":null,"status":1,"statusName":"Active","created_at":"20 Aug 2022, 04:06 PM","updated_at":"20 Aug 2022, 04:06 PM"},{"id":22,"merchant_id":"17","payment_method":"bank","paymentMethodName":"Bank","bank_name":"Bank Asia Ltd","holder_name":"Prince Mahmud","account_no":"88545784661548","branch_name":"Dhaka","routing_no":"467679946454","mobile_company":null,"mobile_no":null,"account_type":null,"status":1,"statusName":"Active","created_at":"20 Aug 2022, 04:48 PM","updated_at":"20 Aug 2022, 04:48 PM"},{"id":25,"merchant_id":"17","payment_method":"bank","paymentMethodName":"Bank","bank_name":"Agrani Bank Ltd","holder_name":"Hhh","account_no":"45555","branch_name":"Vggy","routing_no":"885223","mobile_company":null,"mobile_no":null,"account_type":null,"status":1,"statusName":"Active","created_at":"21 Aug 2022, 10:03 PM","updated_at":"21 Aug 2022, 10:03 PM"}]
/// transactions : [{"id":2,"merchant_id":"17","transaction_id":"fvdsfa","merchantAccount":{"id":12,"merchant_id":"17","payment_method":"bank","paymentMethodName":"Bank","bank_name":"Bank Asia Ltd.","holder_name":"Riaz Uddin","account_no":"654654654654654","branch_name":"Mirpur DOHS,Dhaka","routing_no":"3","mobile_company":null,"mobile_no":null,"account_type":null,"status":1,"statusName":"Active","created_at":"03 Jul 2022, 10:46 AM","updated_at":"03 Jul 2022, 10:46 AM"},"amount":"60,000.00","currency":"","status":4,"statusName":"Processed","created_at":"14 Aug 2022, 09:49 AM","updated_at":"24 Aug 2022, 12:24 AM"}]

class Data {
  Data({
      List<Accounts>? accounts, 
      List<Transactions>? transactions,}){
    _accounts = accounts;
    _transactions = transactions;
}

  Data.fromJson(dynamic json) {
    if (json['accounts'] != null) {
      _accounts = [];
      json['accounts'].forEach((v) {
        _accounts?.add(Accounts.fromJson(v));
      });
    }
    if (json['transactions'] != null) {
      _transactions = [];
      json['transactions'].forEach((v) {
        _transactions?.add(Transactions.fromJson(v));
      });
    }
  }
  List<Accounts>? _accounts;
  List<Transactions>? _transactions;

  List<Accounts>? get accounts => _accounts;
  List<Transactions>? get transactions => _transactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_accounts != null) {
      map['accounts'] = _accounts?.map((v) => v.toJson()).toList();
    }
    if (_transactions != null) {
      map['transactions'] = _transactions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// merchant_id : "17"
/// transaction_id : "fvdsfa"
/// merchantAccount : {"id":12,"merchant_id":"17","payment_method":"bank","paymentMethodName":"Bank","bank_name":"Bank Asia Ltd.","holder_name":"Riaz Uddin","account_no":"654654654654654","branch_name":"Mirpur DOHS,Dhaka","routing_no":"3","mobile_company":null,"mobile_no":null,"account_type":null,"status":1,"statusName":"Active","created_at":"03 Jul 2022, 10:46 AM","updated_at":"03 Jul 2022, 10:46 AM"}
/// amount : "60,000.00"
/// currency : ""
/// status : 4
/// statusName : "Processed"
/// created_at : "14 Aug 2022, 09:49 AM"
/// updated_at : "24 Aug 2022, 12:24 AM"

class Transactions {
  Transactions({
      int? id, 
      String? merchantId, 
      String? transactionId, 
      MerchantAccount? merchantAccount, 
      String? amount, 
      String? currency, 
      int? status, 
      String? statusName, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _merchantId = merchantId;
    _transactionId = transactionId;
    _merchantAccount = merchantAccount;
    _amount = amount;
    _currency = currency;
    _status = status;
    _statusName = statusName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Transactions.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'];
    _transactionId = json['transaction_id'];
    _merchantAccount = json['merchantAccount'] != null ? MerchantAccount.fromJson(json['merchantAccount']) : null;
    _amount = json['amount'];
    _currency = json['currency'];
    _status = json['status'];
    _statusName = json['statusName'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _merchantId;
  String? _transactionId;
  MerchantAccount? _merchantAccount;
  String? _amount;
  String? _currency;
  int? _status;
  String? _statusName;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get merchantId => _merchantId;
  String? get transactionId => _transactionId;
  MerchantAccount? get merchantAccount => _merchantAccount;
  String? get amount => _amount;
  String? get currency => _currency;
  int? get status => _status;
  String? get statusName => _statusName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
    map['transaction_id'] = _transactionId;
    if (_merchantAccount != null) {
      map['merchantAccount'] = _merchantAccount?.toJson();
    }
    map['amount'] = _amount;
    map['currency'] = _currency;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 12
/// merchant_id : "17"
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
/// status : 1
/// statusName : "Active"
/// created_at : "03 Jul 2022, 10:46 AM"
/// updated_at : "03 Jul 2022, 10:46 AM"

class MerchantAccount {
  MerchantAccount({
      int? id, 
      int? merchantId,
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
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _merchantId = merchantId;
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
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  MerchantAccount.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = int.parse(json['merchant_id'].toString());
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
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _merchantId;
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
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get merchantId => _merchantId;
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
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
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
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 12
/// merchant_id : "17"
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
/// status : 1
/// statusName : "Active"
/// created_at : "03 Jul 2022, 10:46 AM"
/// updated_at : "03 Jul 2022, 10:46 AM"

class Accounts {
  Accounts({
      int? id, 
      String? merchantId, 
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
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _merchantId = merchantId;
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
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Accounts.fromJson(dynamic json) {
    _id = json['id'];
    _merchantId = json['merchant_id'].toString();
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
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _merchantId;
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
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get merchantId => _merchantId;
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
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchant_id'] = _merchantId;
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
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}