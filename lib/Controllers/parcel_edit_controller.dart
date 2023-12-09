import 'dart:convert';
import 'package:flutter/material.dart';
import '/Controllers/parcel_controller.dart';
import '../Models/edit_parcel_model.dart';
import '../Models/parcel_logs_model.dart';
import '../Models/parcels_model.dart';
import '../Models/shop_model.dart';
import '../Screen/Widgets/button_global.dart';
import '../Screen/Widgets/constant.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class ParcelEDitController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  bool loaderParcel = false;
  bool loaderLogs = true;
  List<Parcels> parcelList = <Parcels>[];
  List<Shops> shopList = <Shops>[];
  List<Packagings> packagingList = <Packagings>[];
  List<DeliveryCharges> deliveryChargesList = <DeliveryCharges>[];
  List<DropdownMenuItem<ShopsData>> dropDownItems = [];

  late double fragileLiquidAmount = 0;
  late int shopIndex = 0;
  late int packagingIndex = 0;
  late int deliveryChargesIndex = 0;
  MerchantEdit merchantData = MerchantEdit();
  DeliveryCharges deliveryChargesValue = DeliveryCharges();
  double totalCashCollection = 0;
  double deliveryChargeAmount = 0;
  double codChargeAmount = 0;
  double packagingAmount = 0;
  double totalDeliveryChargeAmount = 0;
  double currentPayable = 0;
  double netPayable = 0;
  double fragileLiquidAmounts = 0;
  String pickupPhone = '';
  String pickupAddress = '';
  String shopID = '';
  String packagingID = '';
  String packagingPrice = '0';
  String deliveryChargesID = '';
  String deliveryTypID = 'Same Day';
  String deliveryChargesPrice = '0';
  bool isLiquidChecked = false;
  bool isParcelBankCheck = false;
  double vatTax = 0;
  double vatAmount = 0;
  double merchantCodCharges = 0;





  TextEditingController pickupPhoneController = TextEditingController();
  TextEditingController pickupAddressController = TextEditingController();
  TextEditingController cashCollectionController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController invoiceController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController noteController = TextEditingController();


  List<ParcelEvents> parcelLogsList = <ParcelEvents>[];
  late Parcel parcel;


  @override
  void onInit() {
    super.onInit();
  }


  parcelUpdate(parcelID) {
    loaderParcel = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map chargeDetails = {
      'vatTex': merchantData.vat,
      'VatAmount': vatAmount.toStringAsFixed(2),
      'deliveryChargeAmount': deliveryChargeAmount.toStringAsFixed(2),
      'codChargeAmount': codChargeAmount.toStringAsFixed(2),
      'totalDeliveryChargeAmount': totalDeliveryChargeAmount.toStringAsFixed(2),
      'currentPayable': currentPayable.toStringAsFixed(2),
      'packagingAmount': packagingAmount.toStringAsFixed(2),
      'liquidFragileAmount': fragileLiquidAmounts.toStringAsFixed(2),
    };
    Map body = {
      'chargeDetails': jsonEncode(chargeDetails),
      'shop_id': shopID,
      'weight': deliveryChargesValue.weight == '0'?'':deliveryChargesValue.weight,
      'pickup_phone': pickupPhoneController.text.toString(),
      'pickup_address': pickupAddressController.text.toString(),
      'invoice_no': invoiceController.text.toString(),
      'cash_collection': cashCollectionController.text.toString(),
      'selling_price': sellingPriceController.text.toString(),
      'category_id': deliveryChargesValue.categoryId.toString(),
      'delivery_type_id': deliveryTypID == 'Next Day'? 1: deliveryTypID == 'Same Day'?2: deliveryTypID == 'Sub City'?3: deliveryTypID == 'Outside City'?4:'',
      'customer_name': customerController.text.toString(),
      'customer_address': customerAddressController.text.toString(),
      'customer_phone': customerPhoneController.text.toString(),
      'note': noteController.text.toString(),
      'parcel_bank': isParcelBankCheck ? 'on':'',
      'packaging_id': packagingID == '0'?'':packagingID,
      'fragileLiquid': isLiquidChecked ? 'on':'',
    };
    String jsonBody = json.encode(body);
    server
        .postRequestWithToken(endPoint: APIList.parcelUpdate!+'${parcelID}', body: jsonBody)
        .then((response) {
          print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        clearAll();
        loaderParcel = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.find<ParcelController>().getParcelList();
        Get.back();
        Get.rawSnackbar(
            message: "${jsonResponse['message']}",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      } else if (response != null && response.statusCode == 422) {
        loaderParcel = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loaderParcel = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      }
    });
  }

  clearAll() {
     fragileLiquidAmount = 0;
     fragileLiquidAmounts = 0;
     shopIndex = 0;
     packagingIndex = 0;
     deliveryChargesIndex = 0;
     deliveryChargesValue = DeliveryCharges();
     pickupPhone = '';
     pickupAddress = '';
     shopID = '';
     packagingID = '';
     packagingPrice = '0';
     deliveryChargesID = '';
     deliveryTypID = 'Same Day';
     deliveryChargesPrice = '0';
      isLiquidChecked = false;
      isParcelBankCheck = false;
      pickupPhoneController.text = '';
      pickupAddressController.text = '';
      cashCollectionController.text = '';
      sellingPriceController.text = '';
      invoiceController.text = '';
      customerController.text = '';
      customerPhoneController.text = '';
      customerAddressController.text = '';
      noteController.text = '';
      vatTax = 0;
      vatAmount = 0;
      merchantCodCharges = 0;
      totalCashCollection = 0;
      deliveryChargeAmount = 0;
      codChargeAmount = 0;
      packagingAmount = 0;
      totalDeliveryChargeAmount = 0;
      currentPayable = 0;
     netPayable = 0;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
  }

  void calculateTotal(context,parcelID) {
      totalDeliveryChargeAmount   = 0;
      totalCashCollection = 0;
      codChargeAmount = 0;
      totalDeliveryChargeAmount = 0;
      vatAmount = 0;
      netPayable = 0;
      currentPayable = 0;
      merchantCodCharges = 0;
      packagingAmount = 0;
      fragileLiquidAmounts = 0;

      double deliveryChargeAmount =  0;
      double merchantCodCharge    = 0;

      if(deliveryTypID == 'Same Day'){
            deliveryChargeAmount = double.parse(deliveryChargesValue.sameDay.toString());
            merchantCodCharge = double.parse(merchantData.codCharges!.insideCity.toString());
        }else if (deliveryTypID == 'Next Day') {
        deliveryChargeAmount = double.parse(deliveryChargesValue.nextDay.toString());
        merchantCodCharge = double.parse(merchantData.codCharges!.insideCity.toString());

      } else if (deliveryTypID == 'Sub City') {
        deliveryChargeAmount = double.parse(deliveryChargesValue.subCity.toString());
        merchantCodCharge = double.parse(merchantData.codCharges!.subCity.toString());

      }else if (deliveryTypID == 'Outside City') {
        deliveryChargeAmount = double.parse(deliveryChargesValue.outsideCity.toString());
        merchantCodCharge = double.parse(merchantData.codCharges!.outsideCity.toString());

      }else {
          deliveryChargeAmount = 0;
          merchantCodCharge = 0;
      }
      packagingAmount = double.parse(packagingPrice.toString());
       totalCashCollection          =  double.parse(cashCollectionController.text.toString());
       codChargeAmount              =  percentage(totalCashCollection, merchantCodCharge);
       if(isLiquidChecked){
         totalDeliveryChargeAmount    = (deliveryChargeAmount+codChargeAmount+fragileLiquidAmount+packagingAmount);
         fragileLiquidAmounts = fragileLiquidAmount;
       }else {
         totalDeliveryChargeAmount    = (deliveryChargeAmount+codChargeAmount+packagingAmount);
         fragileLiquidAmounts = 0;
       }

      vatAmount                    = percentage(totalDeliveryChargeAmount, vatTax);
       netPayable                   = (totalDeliveryChargeAmount + vatAmount);
        currentPayable               = (totalCashCollection - (totalDeliveryChargeAmount + vatAmount));
        merchantCodCharges           = merchantCodCharge;
       print('packagingAmount==> '+ '${packagingAmount}');
       print('deliveryChargeAmount==> '+ '${deliveryChargeAmount}');
       print('totalDeliveryChargeAmount==> '+ '${totalDeliveryChargeAmount}');
       print('totalCashCollection==> '+ '${totalCashCollection}');
       print('vatAmount==> '+ '${vatAmount}');
       print('codChargeAmount==> '+ '${codChargeAmount}');
       print('netPayable==> '+ '${netPayable}');
       print('currentPayable==> '+ '${currentPayable}');

       showPopUp(context,parcelID, totalCashCollection,deliveryChargeAmount,codChargeAmount,fragileLiquidAmounts,packagingAmount,totalDeliveryChargeAmount,vatAmount,netPayable,currentPayable);
      Future.delayed(Duration(milliseconds: 10), () {
      update();
      });
  }

  percentage(totalAmount,percentageAmount) {
    return totalAmount * (percentageAmount / 100);
  }


  void showPopUp(context,parcelID, totalCashCollectionParcel,deliveryChargeAmountParcel,codChargeAmountParcel,fragileLiquidAmountsParcel,packagingAmountParcel,totalDeliveryChargeAmountParcel,vatAmountParcel,netPayableParcel,currentPayableParcel) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:  SingleChildScrollView(
             child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'charge_details'.tr,
                    style: kTextStyle.copyWith(
                        color: kSecondaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: Text(
                      'title'.tr,
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    trailing: Text(
                      'amount_tk'.tr,
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'cash_collection'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${totalCashCollectionParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'delivery_charges'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${deliveryChargeAmountParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'cod_charge'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${codChargeAmountParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'liquid_fragile_charge'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${fragileLiquidAmountsParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'p_charge'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${packagingAmountParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'total_charge'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${totalDeliveryChargeAmountParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'vat'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${vatAmountParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'net_payable'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${netPayableParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'current_payable'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${currentPayableParcel.toStringAsFixed(2)}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ButtonGlobal(buttontext: 'confirm'.tr, buttonDecoration: kButtonDecoration, onPressed: (){
                    FocusScope.of(context).requestFocus(new FocusNode());
                    parcelUpdate(parcelID);
                    Get.back();
                    // Get.off(ParcelPage());
                  })
                ],
              )),
            ),
          );
        });
  }



  editParcel(id) {
    loaderLogs = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    server.getRequest(endPoint: APIList.parcelEdit!+id.toString()).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var editData = EditParcelModel.fromJson(jsonResponse);
        fragileLiquidAmount = double.parse(editData.data!.fragileLiquid.toString());
        print(fragileLiquidAmount);
        merchantData = editData.data!.merchant!;
        vatTax = double.parse(merchantData.vat.toString());
        shopList = <Shops>[];
        shopList.addAll(editData.data!.shops!);
        packagingList = <Packagings>[];
        packagingList.add(Packagings(id:0,name: 'select_packaging'.tr,price: '0',));
        packagingList.addAll(editData.data!.packagings!);
        deliveryChargesList = <DeliveryCharges>[];
        deliveryChargesList.add(DeliveryCharges(id:0,category: 'select_category'.tr,weight: '0',));
        deliveryChargesList.addAll(editData.data!.deliveryCharges!);
        if(shopList.isNotEmpty){
          pickupPhone = shopList[shopIndex].contactNo.toString();
          pickupAddress = shopList[shopIndex].address.toString();
          shopID = shopList[shopIndex].id.toString();
        }
        deliveryChargesIndex = deliveryChargesList.indexWhere((i){
          if(i.categoryId == editData.data!.parcel!.categoryId.toString() && i.weight == editData.data!.parcel!.weight.toString()) {
            return true;
          }else if(i.categoryId == editData.data!.parcel!.categoryId.toString()){
            return true;
          }
          return false;
        });
        if(deliveryChargesIndex.toString() != '-1'){
          deliveryChargesID = deliveryChargesList[deliveryChargesIndex].categoryId.toString();
          print(deliveryChargesIndex);
          deliveryChargesValue = deliveryChargesList[deliveryChargesIndex];
        }else {
          deliveryChargesIndex = 0;
        }

        deliveryTypID = editData.data!.parcel!.deliveryTypeId == '1' ? 'Same Day':editData.data!.parcel!.deliveryTypeId == '2' ?'Next Day':editData.data!.parcel!.deliveryTypeId == '3' ? 'Sub City':editData.data!.parcel!.deliveryTypeId == '4' ? 'Outside City':'Same Day';
        if(editData.data!.parcel!.liquidFragileAmount != null || editData.data!.parcel!.liquidFragileAmount != ''){
          isLiquidChecked = true;
        }
        if(editData.data!.parcel!.parcelBank != null){
          isParcelBankCheck = true;
        }
        if(editData.data!.parcel!.packagingId != 'null'){
          packagingIndex =  packagingList.indexWhere((i) => i.id == int.parse(editData.data!.parcel!.packagingId.toString()));;
          packagingID = editData.data!.parcel!.packagingId.toString();
          packagingPrice = packagingList[packagingIndex].price.toString();
        }
        shopIndex = shopList.indexWhere((i) => i.id == int.parse(editData.data!.parcel!.merchantShopId.toString()));
        shopID = editData.data!.parcel!.merchantShopId.toString();
        customerController.text = editData.data!.parcel!.customerName.toString();
        customerPhoneController.text = editData.data!.parcel!.customerPhone.toString();
        customerAddressController.text = editData.data!.parcel!.customerAddress.toString();
        pickupPhoneController.text = editData.data!.parcel!.pickupPhone.toString();
        pickupAddressController.text = editData.data!.parcel!.pickupAddress.toString();
        cashCollectionController.text = editData.data!.parcel!.cashCollection.toString();
        sellingPriceController.text = editData.data!.parcel!.sellingPrice.toString();
        invoiceController.text = editData.data!.parcel!.invoiceNo.toString();
        noteController.text = editData.data!.parcel!.note.toString();

        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }


}
