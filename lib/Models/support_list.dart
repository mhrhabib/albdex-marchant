class SupportList {
  SupportList({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SupportList.fromJson(dynamic json) {
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

/// supports : [{"id":8,"subject":"Problem parcel","userName":"Riaz Uddin","userEmail":"riazuddin@gmail.com","userMobile":"01820064106","department":"General Management","service":"pickup","priority":"low","description":"dfdxzfzxv","date":"18th august 2022"},{"id":7,"subject":"Problem parcel","userName":"Riaz Uddin","userEmail":"riazuddin@gmail.com","userMobile":"01820064106","department":"General Management","service":"pickup","priority":"low","description":"dfdxzfzxv","date":"18th august 2022"}]

class Data {
  Data({
      List<Supports>? supports,}){
    _supports = supports;
}

  Data.fromJson(dynamic json) {
    if (json['supports'] != null) {
      _supports = [];
      json['supports'].forEach((v) {
        _supports?.add(Supports.fromJson(v));
      });
    }
  }
  List<Supports>? _supports;

  List<Supports>? get supports => _supports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_supports != null) {
      map['supports'] = _supports?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 8
/// subject : "Problem parcel"
/// userName : "Riaz Uddin"
/// userEmail : "riazuddin@gmail.com"
/// userMobile : "01820064106"
/// department : "General Management"
/// service : "pickup"
/// priority : "low"
/// description : "dfdxzfzxv"
/// date : "18th august 2022"

class Supports {
  Supports({
      int? id, 
      String? subject, 
      String? userName, 
      String? userEmail, 
      String? userMobile, 
      String? department, 
      String? service, 
      String? priority, 
      String? description, 
      String? date,}){
    _id = id;
    _subject = subject;
    _userName = userName;
    _userEmail = userEmail;
    _userMobile = userMobile;
    _department = department;
    _service = service;
    _priority = priority;
    _description = description;
    _date = date;
}

  Supports.fromJson(dynamic json) {
    _id = json['id'];
    _subject = json['subject'];
    _userName = json['userName'];
    _userEmail = json['userEmail'];
    _userMobile = json['userMobile'];
    _department = json['department'];
    _service = json['service'];
    _priority = json['priority'];
    _description = json['description'];
    _date = json['date'];
  }
  int? _id;
  String? _subject;
  String? _userName;
  String? _userEmail;
  String? _userMobile;
  String? _department;
  String? _service;
  String? _priority;
  String? _description;
  String? _date;

  int? get id => _id;
  String? get subject => _subject;
  String? get userName => _userName;
  String? get userEmail => _userEmail;
  String? get userMobile => _userMobile;
  String? get department => _department;
  String? get service => _service;
  String? get priority => _priority;
  String? get description => _description;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subject'] = _subject;
    map['userName'] = _userName;
    map['userEmail'] = _userEmail;
    map['userMobile'] = _userMobile;
    map['department'] = _department;
    map['service'] = _service;
    map['priority'] = _priority;
    map['description'] = _description;
    map['date'] = _date;
    return map;
  }

}