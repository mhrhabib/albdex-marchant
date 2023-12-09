class BalanceDetailsModel {
  double? amountDelivered;
  double? payableDeliveryCharge;
  double? subTotal;
  double? vatAmount;
  double? codCharge;
  double? availableBalance;
  int? clearableParcels;

  BalanceDetailsModel(
      {this.amountDelivered,
        this.payableDeliveryCharge,
        this.subTotal,
        this.vatAmount,
        this.codCharge,
        this.availableBalance,
        this.clearableParcels});

  BalanceDetailsModel.fromJson(Map<String, dynamic> json) {

    amountDelivered = json['amount_delivered'] != null? double.parse(json['amount_delivered'].toString())*1.0:0;
    payableDeliveryCharge = json['payable_delivery_charge']!= null? double.parse(json['payable_delivery_charge'].toString())*1.0:0;
    subTotal = json['sub_total']!= null? double.parse(json['sub_total'].toString())*1.0:0;
    vatAmount = json['vat_amount']!= null? double.parse(json['vat_amount'].toString())*1.0:0;
    codCharge = json['cod_charge']!= null? double.parse(json['cod_charge'].toString())*1.0:0;
    availableBalance = json['available_balance']!= null? double.parse(json['available_balance'].toString())*1.0:0;
    clearableParcels = json['clearable_parcels']!= null? int.parse(json['clearable_parcels'].toString()):0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount_delivered'] = this.amountDelivered;
    data['payable_delivery_charge'] = this.payableDeliveryCharge;
    data['sub_total'] = this.subTotal;
    data['vat_amount'] = this.vatAmount;
    data['cod_charge'] = this.codCharge;
    data['available_balance'] = this.availableBalance;
    data['clearable_parcels'] = this.clearableParcels;
    return data;
  }
}