class CodChargeModel {
  CodChargeModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CodChargeModel.fromJson(dynamic json) {
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
      List<CodChargesData>? codCharges,}){
    _codCharges = codCharges;
}

  Data.fromJson(dynamic json) {
    if (json['codCharges'] != null) {
      _codCharges = [];
      json['codCharges'].forEach((v) {
        _codCharges?.add(CodChargesData.fromJson(v));
      });
    }
  }
  List<CodChargesData>? _codCharges;

  List<CodChargesData>? get codCharges => _codCharges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_codCharges != null) {
      map['codCharges'] = _codCharges?.map((v) => v.toJson()).toList();
    }
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