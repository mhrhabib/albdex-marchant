import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/parcel_crate_model.dart';
import '../Models/parcel_logs_model.dart';
import '../Models/parcels_model.dart';
import '../Models/shop_model.dart';
import '../Screen/Widgets/button_global.dart';
import '../Screen/Widgets/constant.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class ParcelController extends GetxController {
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

  RxDouble fragileLiquidAmount = 0.0.obs;
  late int shopIndex = 0;
  late int packagingIndex = 0;
  late int deliveryChargesIndex = 0;
  var merchantData = MerchantData().obs;
  var deliveryChargesValue = DeliveryCharges().obs;
  String pickupPhone = '';
  String pickupAddress = '';
  String shopID = '';
  String packagingID = '';
  String packagingPrice = '0';
  var deliveryChargesID = ''.obs;
  var deliveryTypID = 'Same Day'.obs;
  String deliveryChargesPrice = '0';
  bool isLiquidChecked = false;
  bool isParcelBankCheck = false;
  RxDouble vatTax = 0.0.obs;
  RxDouble vatAmount = 0.0.obs;
  RxDouble merchantCodCharges = 0.0.obs;
  var totalCashCollection = 0.0.obs;
  var deliveryChargeAmount = 0.0.obs;
  var codChargeAmount = 0.0.obs;
  RxDouble packagingAmount = 0.0.obs;
  RxDouble totalDeliveryChargeAmount = 0.0.obs;
  RxDouble currentPayable = 0.0.obs;
  RxDouble netPayable = 0.0.obs;
  RxDouble fragileLiquidAmounts = 0.0.obs;

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
    getParcel();
    super.onInit();
  }

  getParcelList() async {
    loader = true;
    await Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getParcel();
  }

  getParcel() {
    server.getRequest(endPoint: APIList.parcelList).then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var parcelData = ParcelsModel.fromJson(jsonResponse);
        parcelList = <Parcels>[];
        parcelList.addAll(parcelData.data!.parcels!);
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

  getParcelLogs(id) {
    loaderLogs = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    parcelLogsList = <ParcelEvents>[];
    server
        .getRequest(endPoint: APIList.parcelLogs! + id.toString())
        .then((response) {
      if (response != null && response.statusCode == 200) {
        loaderLogs = false;
        final jsonResponse = json.decode(response.body);
        var parcelData = ParcelLogsModel.fromJson(jsonResponse);
        parcelLogsList = <ParcelEvents>[];
        parcelLogsList.addAll(parcelData.data!.parcelEvents!);
        parcel = parcelData.data!.parcel!;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loaderLogs = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  crateParcel() {
    server.getRequest(endPoint: APIList.parcelCreate).then((response) {
      print(">>>>>>parcel code${response.statusCode}");
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var data = ParcelCrateModel.fromJson(jsonResponse);
        fragileLiquidAmount.value =
            double.parse(data.data!.fragileLiquid.toString());
        print(">>>>>>>>>>>>>>>${fragileLiquidAmount.value}");
        merchantData.value = data.data!.merchant!;
        print(">>merchant value${merchantData.value.codCharges!.insideCity!}");
        vatTax.value = double.parse(merchantData.value.vat.toString());
        shopList = <Shops>[];
        shopList.addAll(data.data!.shops!);
        packagingList = <Packagings>[];
        packagingList.add(Packagings(
          id: 0,
          name: 'select_packaging'.tr,
          price: '0',
        ));
        packagingList.addAll(data.data!.packagings!);
        deliveryChargesList = <DeliveryCharges>[];
        deliveryChargesList.add(DeliveryCharges(
          id: 0,
          category: 'select_category'.tr,
          weight: '0',
        ));
        deliveryChargesList.addAll(data.data!.deliveryCharges!);
        if (shopList.isNotEmpty) {
          pickupPhone = shopList[shopIndex].contactNo.toString();
          pickupAddress = shopList[shopIndex].address.toString();
          shopID = shopList[shopIndex].id.toString();
        }
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

  parcelPost() async {
    loaderParcel = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map chargeDetails = {
      'vatTex': merchantData.value.vat,
      'VatAmount': vatAmount.value,
      'deliveryChargeAmount': deliveryChargeAmount.value,
      'codChargeAmount': codChargeAmount.value,
      'totalDeliveryChargeAmount': totalDeliveryChargeAmount.value,
      'currentPayable': currentPayable.value,
      'packagingAmount': packagingAmount.value,
      'liquidFragileAmount': fragileLiquidAmounts.value,
    };

    print(">>>>>>$chargeDetails");
    Map body = {
      'chargeDetails': jsonEncode(chargeDetails),
      'shop_id': shopID,
      'weight': deliveryChargesValue.value.weight == '0'
          ? ''
          : deliveryChargesValue.value.weight,
      'pickup_phone': pickupPhoneController.text.toString(),
      'pickup_address': pickupAddressController.text.toString(),
      'invoice_no': invoiceController.text.toString(),
      'cash_collection': cashCollectionController.text.toString(),
      'selling_price': sellingPriceController.text.toString(),
      'category_id': deliveryChargesValue.value.categoryId.toString(),
      'delivery_type_id': deliveryTypID.value == 'Next Day'
          ? 1
          : deliveryTypID.value == 'Same Day'
              ? 2
              : deliveryTypID.value == 'Sub City'
                  ? 3
                  : deliveryTypID.value == 'Outside City'
                      ? 4
                      : '',
      'customer_name': customerController.text.toString(),
      'customer_address': customerAddressController.text.toString(),
      'customer_phone': customerPhoneController.text.toString(),
      'note': noteController.text.toString(),
      'parcel_bank': isParcelBankCheck ? 'on' : '',
      'packaging_id': packagingID == '0' ? '' : packagingID,
      'fragileLiquid': isLiquidChecked ? 'on' : '',
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .postRequestWithToken(endPoint: APIList.parcelStore, body: jsonBody)
        .then((response) async {
      print(">>>>>>>>>>>>>>>>>>>${response.statusCode}");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        clearAll();
        loaderParcel = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        parcelList.clear();
        await getParcelList();

        Navigator.pop(Get.context!);
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
    fragileLiquidAmount.value = 0;
    fragileLiquidAmounts.value = 0;
    shopIndex = 0;
    packagingIndex = 0;
    deliveryChargesIndex = 0;
    deliveryChargesValue.value = DeliveryCharges();
    pickupPhone = '';
    pickupAddress = '';
    shopID = '';
    packagingID = '';
    packagingPrice = '0';
    deliveryChargesID.value = '';
    deliveryTypID.value = 'Same Day';
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
    vatTax.value = 0;
    vatAmount.value = 0;
    merchantCodCharges.value = 0;
    totalCashCollection.value = 0;
    //deliveryChargeAmount.value = 0;
    codChargeAmount.value = 0.0;
    packagingAmount.value = 0;
    totalDeliveryChargeAmount.value = 0;
    currentPayable.value = 0;
    netPayable.value = 0;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
  }

  void calculateTotal(context) {
    totalDeliveryChargeAmount.value = 0.0;
    totalCashCollection.value = 0.0;
    codChargeAmount.value = 0.0;
    totalDeliveryChargeAmount.value = 0.0;
    vatAmount.value = 0.0;
    netPayable.value = 0.0;
    currentPayable.value = 0.0;
    merchantCodCharges.value = 0.0;
    packagingAmount.value = 0.0;
    fragileLiquidAmounts.value = 0.0;

    // var deliveryChargeAmount = 0.0.obs;
    RxDouble merchantCodCharge = 0.0.obs;
    print(">>>>>>>>>${merchantData.value.codCharges!.insideCity}");
    print(">>>>&&&&${merchantData.value.codCharges!.subCity}");
    print("*********${merchantData.value.codCharges!.outsideCity}");

    if (deliveryTypID.value == 'Same Day') {
      deliveryChargeAmount.value =
          double.parse(deliveryChargesValue.value.sameDay.toString());
      merchantCodCharge.value =
          double.parse(merchantData.value.codCharges!.insideCity ?? 0.0);
    } else if (deliveryTypID.value == 'Next Day') {
      deliveryChargeAmount.value =
          double.parse(deliveryChargesValue.value.nextDay.toString());
      merchantCodCharge.value =
          double.parse(merchantData.value.codCharges!.insideCity ?? 0.0);
    } else if (deliveryTypID.value == 'Sub City') {
      deliveryChargeAmount.value =
          double.parse(deliveryChargesValue.value.subCity ?? 0.0);
      merchantCodCharge.value =
          double.parse(merchantData.value.codCharges!.subCity ?? 0.0);
    } else if (deliveryTypID.value == 'Outside City') {
      deliveryChargeAmount.value =
          double.parse(deliveryChargesValue.value.outsideCity ?? 0.0);
      merchantCodCharge.value =
          double.parse(merchantData.value.codCharges!.outsideCity ?? 0.0);
    } else {
      deliveryChargeAmount.value = 0;
      merchantCodCharge.value = 0;
    }
    packagingAmount.value = double.parse(packagingPrice.toString());
    totalCashCollection.value =
        double.parse(cashCollectionController.text.toString());
    codChargeAmount.value =
        percentage(totalCashCollection.value, merchantCodCharge.value);
    print(totalCashCollection.value);
    print(merchantCodCharge.value);
    if (isLiquidChecked) {
      totalDeliveryChargeAmount.value = (deliveryChargeAmount.value +
          codChargeAmount.value +
          fragileLiquidAmount.value +
          packagingAmount.value);
      fragileLiquidAmounts.value = fragileLiquidAmount.value;
    } else {
      totalDeliveryChargeAmount.value = (deliveryChargeAmount.value +
          codChargeAmount.value +
          packagingAmount.value);
      fragileLiquidAmounts.value = 0;
    }

    vatAmount.value = percentage(totalDeliveryChargeAmount.value, vatTax.value);
    netPayable.value = (totalDeliveryChargeAmount.value + vatAmount.value);
    currentPayable.value = (totalCashCollection.value -
        (totalDeliveryChargeAmount.value + vatAmount.value));
    merchantCodCharges.value = merchantCodCharge.value;
    print('packagingAmount==> ' + '${packagingAmount.value}');
    print('deliveryChargeAmount==> ' + '${deliveryChargeAmount.value}');
    print(
        'totalDeliveryChargeAmount==> ' + '${totalDeliveryChargeAmount.value}');
    print('totalCashCollection==> ' + '${totalCashCollection.value}');
    print('vatAmount==> ' + '${vatAmount.value}');
    print('codChargeAmount==> ' + '${codChargeAmount.value}');
    print('netPayable==> ' + '${netPayable.value}');
    print('currentPayable==> ' + '${currentPayable.value}');

    showPopUp(
        context,
        totalCashCollection,
        deliveryChargeAmount,
        codChargeAmount,
        fragileLiquidAmounts,
        packagingAmount,
        totalDeliveryChargeAmount,
        vatAmount,
        netPayable,
        currentPayable);
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
  }

  percentage(double totalAmount, double percentageAmount) {
    return totalAmount * (percentageAmount / 100);
  }

  void showPopUp(
      context,
      totalCashCollectionParcel,
      deliveryChargeAmountParcel,
      codChargeAmountParcel,
      fragileLiquidAmountsParcel,
      packagingAmountParcel,
      totalDeliveryChargeAmountParcel,
      vatAmountParcel,
      netPayableParcel,
      currentPayableParcel) {
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
              child: SingleChildScrollView(
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
                        '${totalCashCollectionParcel}',
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
                        '${deliveryChargeAmountParcel}',
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
                        '${codChargeAmountParcel}',
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
                        '${fragileLiquidAmountsParcel}',
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
                        '${packagingAmountParcel}',
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
                        '${totalDeliveryChargeAmountParcel}',
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
                        '${vatAmountParcel}',
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
                        '${netPayableParcel}',
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
                        '${currentPayableParcel}',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ButtonGlobal(
                      buttontext: 'confirm'.tr,
                      buttonDecoration: kButtonDecoration,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(new FocusNode());

                        parcelPost();
                        Get.back();
                        // Get.off(ParcelPage());
                      })
                ],
              )),
            ),
          );
        });
  }
}
