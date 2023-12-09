class ParcelModel {
  int? id;
  String? invoice;
  String? trackingId;
  String? customerName;
  String? customerPhone;
  String? cashCollection;
  String? charge;
  String? currentPayable;
  String? statusName;
  String? date;

  ParcelModel(
      {this.id,
        this.invoice,
        this.trackingId,
        this.customerName,
        this.customerPhone,
        this.cashCollection,
        this.charge,
        this.currentPayable,
        this.statusName,
        this.date});

  ParcelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoice = json['invoice'];
    trackingId = json['tracking_id'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    cashCollection = json['cash_collection'];
    charge = json['charge'];
    currentPayable = json['current_payable'];
    statusName = json['statusName'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice'] = this.invoice;
    data['tracking_id'] = this.trackingId;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['cash_collection'] = this.cashCollection;
    data['charge'] = this.charge;
    data['current_payable'] = this.currentPayable;
    data['status_name'] = this.statusName;
    data['date'] = this.date;
    return data;
  }
}