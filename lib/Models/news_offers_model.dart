class NewsOffersModel {
  NewsOffersModel({
      bool? success, 
      String? message, 
      OfferData? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  NewsOffersModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? OfferData.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  OfferData? _data;

  bool? get success => _success;
  String? get message => _message;
  OfferData? get data => _data;

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

class OfferData {
  OfferData({
      List<NewsOffers>? newsOffers,}){
    _newsOffers = newsOffers;
}

  OfferData.fromJson(dynamic json) {
    if (json['newsOffers'] != null) {
      _newsOffers = [];
      json['newsOffers'].forEach((v) {
        _newsOffers?.add(NewsOffers.fromJson(v));
      });
    }
  }
  List<NewsOffers>? _newsOffers;

  List<NewsOffers>? get newsOffers => _newsOffers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_newsOffers != null) {
      map['newsOffers'] = _newsOffers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class NewsOffers {
  NewsOffers({
      int? id, 
      String? title, 
      String? author, 
      String? description, 
      String? image, 
      int? status, 
      String? statusName, 
      String? date,}){
    _id = id;
    _title = title;
    _author = author;
    _description = description;
    _image = image;
    _status = status;
    _statusName = statusName;
    _date = date;
}

  NewsOffers.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _author = json['author'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
    _statusName = json['statusName'];
    _date = json['date'];
  }
  int? _id;
  String? _title;
  String? _author;
  String? _description;
  String? _image;
  int? _status;
  String? _statusName;
  String? _date;

  int? get id => _id;
  String? get title => _title;
  String? get author => _author;
  String? get description => _description;
  String? get image => _image;
  int? get status => _status;
  String? get statusName => _statusName;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['author'] = _author;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['date'] = _date;
    return map;
  }

}