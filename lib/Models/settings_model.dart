class SettingsModel {
  SettingsModel({
      Data? data,}){
    _data = data;
}

  SettingsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      int? id, 
      String? name, 
      String? phone, 
      String? email, 
      String? currency, 
      String? copyright,
      String? logo,
      String? favicon,
      String? parTrackPrefix, 
      String? invoicePrefix,}){
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _currency = currency;
    _copyright = copyright;
    _logo = logo;
    _favicon = favicon;
    _parTrackPrefix = parTrackPrefix;
    _invoicePrefix = invoicePrefix;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _currency = json['currency'];
    _copyright = json['copyright'];
    _logo = json['logo'].toString();
    _favicon = json['favicon'].toString();
    _parTrackPrefix = json['par_track_prefix'];
    _invoicePrefix = json['invoice_prefix'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _email;
  String? _currency;
  String? _copyright;
  String? _logo;
  String? _favicon;
  String? _parTrackPrefix;
  String? _invoicePrefix;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get currency => _currency;
  String? get copyright => _copyright;
  String? get logo => _logo;
  String? get favicon => _favicon;
  String? get parTrackPrefix => _parTrackPrefix;
  String? get invoicePrefix => _invoicePrefix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['currency'] = _currency;
    map['copyright'] = _copyright;
    map['logo'] = _logo;
    map['favicon'] = _favicon;
    map['par_track_prefix'] = _parTrackPrefix;
    map['invoice_prefix'] = _invoicePrefix;
    return map;
  }

}