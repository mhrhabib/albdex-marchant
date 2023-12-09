class DateToDateStatementModel {
  bool? success;
  String? message;
  Data? data;

  DateToDateStatementModel({this.success, this.message, this.data});

  DateToDateStatementModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Merchant? merchant;
  ParcelStatusWiseCount? parcelStatusWiseCount;
  ProfitInfo? profitInfo;
  CashCollectionInfo? cashCollectionInfo;
  PayableToMerchant? payableToMerchant;

  Data({this.merchant, this.parcelStatusWiseCount, this.profitInfo, this.cashCollectionInfo, this.payableToMerchant});

  Data.fromJson(Map<String, dynamic> json) {
    merchant = json['merchant'] != null ? new Merchant.fromJson(json['merchant']) : null;
    parcelStatusWiseCount = json['parcelStatusWiseCount'] != null ? new ParcelStatusWiseCount.fromJson(json['parcelStatusWiseCount']) : null;
    profitInfo = json['profitInfo'] != null ? new ProfitInfo.fromJson(json['profitInfo']) : null;
    cashCollectionInfo = json['cashCollectionInfo'] != null ? new CashCollectionInfo.fromJson(json['cashCollectionInfo']) : null;
    payableToMerchant = json['payableToMerchant'] != null ? new PayableToMerchant.fromJson(json['payableToMerchant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.merchant != null) {
      data['merchant'] = this.merchant!.toJson();
    }
    if (this.parcelStatusWiseCount != null) {
      data['parcelStatusWiseCount'] = this.parcelStatusWiseCount!.toJson();
    }
    if (this.profitInfo != null) {
      data['profitInfo'] = this.profitInfo!.toJson();
    }
    if (this.cashCollectionInfo != null) {
      data['cashCollectionInfo'] = this.cashCollectionInfo!.toJson();
    }
    if (this.payableToMerchant != null) {
      data['payableToMerchant'] = this.payableToMerchant!.toJson();
    }
    return data;
  }
}

class Merchant {
  int? id;
  int? userId;
  String? businessName;
  String? merchantUniqueId;
  String? currentBalance;
  String? openingBalance;
  String? vat;
  CodCharges? codCharges;
  int? status;
  String? address;
  String? paymentPeriod;
  String? returnCharges;
  String? referenceName;
  String? referencePhone;
  String? createdAt;
  String? updatedAt;

  Merchant({this.id, this.userId, this.businessName, this.merchantUniqueId, this.currentBalance, this.openingBalance, this.vat, this.codCharges,this.status, this.address, this.paymentPeriod, this.returnCharges, this.referenceName, this.referencePhone, this.createdAt, this.updatedAt});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    businessName = json['business_name'];
    merchantUniqueId = json['merchant_unique_id'];
    currentBalance = json['current_balance'];
    openingBalance = json['opening_balance'];
    vat = json['vat'];
    codCharges = json['cod_charges'] != null ? new CodCharges.fromJson(json['cod_charges']) : null;
    status = json['status'];
    address = json['address'];
    paymentPeriod = json['payment_period'];
    returnCharges = json['return_charges'];
    referenceName = json['reference_name'];
    referencePhone = json['reference_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['business_name'] = this.businessName;
    data['merchant_unique_id'] = this.merchantUniqueId;
    data['current_balance'] = this.currentBalance;
    data['opening_balance'] = this.openingBalance;
    data['vat'] = this.vat;
    if (this.codCharges != null) {
      data['cod_charges'] = this.codCharges!.toJson();
    }
    data['status'] = this.status;
    data['address'] = this.address;
    data['payment_period'] = this.paymentPeriod;
    data['return_charges'] = this.returnCharges;
    data['reference_name'] = this.referenceName;
    data['reference_phone'] = this.referencePhone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CodCharges {
  String? insideCity;
  String? subCity;
  String? outsideCity;

  CodCharges({this.insideCity, this.subCity, this.outsideCity});

  CodCharges.fromJson(Map<String, dynamic> json) {
    insideCity = json['inside_city'];
    subCity = json['sub_city'];
    outsideCity = json['outside_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inside_city'] = this.insideCity;
    data['sub_city'] = this.subCity;
    data['outside_city'] = this.outsideCity;
    return data;
  }
}

class ParcelStatusWiseCount {
  int? delivered;
  int? returnReceivedByMerchant;
  int? partialDelivered;
  int? returnAssignToMerchant;
  int? returnToCourier;

  ParcelStatusWiseCount({this.delivered, this.returnReceivedByMerchant, this.partialDelivered, this.returnAssignToMerchant, this.returnToCourier});

  ParcelStatusWiseCount.fromJson(Map<String, dynamic> json) {
    delivered = json['Delivered'];
    returnReceivedByMerchant = json['Return received by merchant'];
    partialDelivered = json['Partial Delivered'];
    returnAssignToMerchant = json['Return assign to merchant'];
    returnToCourier = json['Return to Courier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Delivered'] = this.delivered;
    data['Return received by merchant'] = this.returnReceivedByMerchant;
    data['Partial Delivered'] = this.partialDelivered;
    data['Return assign to merchant'] = this.returnAssignToMerchant;
    data['Return to Courier'] = this.returnToCourier;
    return data;
  }
}

class ProfitInfo {
  double? totalDeliveryCharge;
  String? totalProfit;

  ProfitInfo({this.totalDeliveryCharge, this.totalProfit});

  ProfitInfo.fromJson(Map<String, dynamic> json) {
    totalDeliveryCharge = json['total_delivery_charge'];
    totalProfit = json['total_profit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_delivery_charge'] = this.totalDeliveryCharge;
    data['total_profit'] = this.totalProfit;
    return data;
  }
}

class CashCollectionInfo {
  int? totalCashCollection;
  int? totalSellingPrice;

  CashCollectionInfo({this.totalCashCollection, this.totalSellingPrice});

  CashCollectionInfo.fromJson(Map<String, dynamic> json) {
    totalCashCollection = json['totalCashCollection'];
    totalSellingPrice = json['totalSellingPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCashCollection'] = this.totalCashCollection;
    data['totalSellingPrice'] = this.totalSellingPrice;
    return data;
  }
}

class PayableToMerchant {
  double? totalPayableMerchant;
  int? totalPaidByMerchant;

  PayableToMerchant({this.totalPayableMerchant, this.totalPaidByMerchant});

  PayableToMerchant.fromJson(Map<String, dynamic> json) {
    totalPayableMerchant = json['total_payable_merchant'];
    totalPaidByMerchant = json['total_paid_by_merchant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_payable_merchant'] = this.totalPayableMerchant;
    data['total_paid_by_merchant'] = this.totalPaidByMerchant;
    return data;
  }
}