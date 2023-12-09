class StatementListModel {
  StatementListModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  StatementListModel.fromJson(dynamic json) {
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

/// statements : [{"id":154,"note":"Payment Withdrawal","date":"24th august 2022","amount":"60,000.00","currency":"","type":2,"typeName":"Expense","created_at":"24 Aug 2022, 12:24 AM","updated_at":"24 Aug 2022, 12:24 AM"}]

class Data {
  Data({
      List<Statements>? statements,}){
    _statements = statements;
}

  Data.fromJson(dynamic json) {
    if (json['statements'] != null) {
      _statements = [];
      json['statements'].forEach((v) {
        _statements?.add(Statements.fromJson(v));
      });
    }
  }
  List<Statements>? _statements;

  List<Statements>? get statements => _statements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_statements != null) {
      map['statements'] = _statements?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 154
/// note : "Payment Withdrawal"
/// date : "24th august 2022"
/// amount : "60,000.00"
/// currency : ""
/// type : 2
/// typeName : "Expense"
/// created_at : "24 Aug 2022, 12:24 AM"
/// updated_at : "24 Aug 2022, 12:24 AM"

class Statements {
  Statements({
      int? id, 
      String? note, 
      String? date, 
      String? amount, 
      String? currency, 
      int? type, 
      String? typeName, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _note = note;
    _date = date;
    _amount = amount;
    _currency = currency;
    _type = type;
    _typeName = typeName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Statements.fromJson(dynamic json) {
    _id = json['id'];
    _note = json['note'];
    _date = json['date'];
    _amount = json['amount'];
    _currency = json['currency'];
    _type = json['type'];
    _typeName = json['typeName'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _note;
  String? _date;
  String? _amount;
  String? _currency;
  int? _type;
  String? _typeName;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get note => _note;
  String? get date => _date;
  String? get amount => _amount;
  String? get currency => _currency;
  int? get type => _type;
  String? get typeName => _typeName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['note'] = _note;
    map['date'] = _date;
    map['amount'] = _amount;
    map['currency'] = _currency;
    map['type'] = _type;
    map['typeName'] = _typeName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}