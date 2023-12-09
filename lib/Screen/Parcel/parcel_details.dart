import '/Models/parcels_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../Controllers/global-controller.dart';
import '../../Controllers/parcel_controller.dart';
import '../Widgets/constant.dart';
import '../Widgets/shimmer/parcel_log_shimmer.dart';

class ParcelDetails extends StatefulWidget {
  final Parcels parcel;
  final int? id;

  ParcelDetails({Key? key, required this.parcel, this.id}) : super(key: key);

  @override
  State<ParcelDetails> createState() => _ParcelDetailsState();
}

class _ParcelDetailsState extends State<ParcelDetails> {
  int statusActive = 1;
  ParcelController parcelController = Get.put(ParcelController());
  @override
  void initState() {
    parcelController.getParcelLogs(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'parcel_details'.tr,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GetBuilder<ParcelController>(
          init: ParcelController(),
          builder: (parcelLogs) => Container(
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    statusActive = 1;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: statusActive == 1
                                      ? BoxDecoration(
                                          color: kMainColor,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        )
                                      : BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border: Border.fromBorderSide(
                                            BorderSide(
                                              color: kMainColor,
                                            ),
                                          ),
                                        ),
                                  child: Center(
                                      child: Text('details'.tr,
                                          style: TextStyle(
                                              color: statusActive == 1
                                                  ? Colors.white
                                                  : kMainColor))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    statusActive = 2;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: statusActive == 2
                                      ? BoxDecoration(
                                          color: kMainColor,
                                          borderRadius:
                                              BorderRadius.circular(40))
                                      : BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border: Border.fromBorderSide(
                                            BorderSide(
                                              color: kMainColor,
                                            ),
                                          ),
                                        ),
                                  child: Center(
                                    child: Text(
                                      'parcel_log'.tr,
                                      style: TextStyle(
                                        color: statusActive == 2
                                            ? Colors.white
                                            : kMainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.76,
                          child: SingleChildScrollView(
                            child: statusActive == 1
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            elevation: 10,
                                            color: kSecondaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                'invoice'.tr +
                                                    ': #${widget.parcel.invoiceNO}',
                                                style: kTextStyle.copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 10,
                                            color: kSecondaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                widget.parcel.statusName
                                                    .toString(),
                                                style: kTextStyle.copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'cash_of_delivery'.tr,
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: kGreyTextColor.withOpacity(0.5),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            'delivery_fee'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${(double.parse(widget.parcel.totalDeliveryAmount.toString()) - double.parse(widget.parcel.codAmount.toString())).toStringAsFixed(2)}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'cod'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${widget.parcel.codAmount}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'total_cost'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${widget.parcel.totalDeliveryAmount}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'delivery_info'.tr,
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: kGreyTextColor.withOpacity(0.5),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            'delivery_type'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.deliveryType
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'weight'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.weight.toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'amount_to_collection'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${widget.parcel.cashCollection}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'sender_info'.tr,
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: kGreyTextColor.withOpacity(0.5),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            'business_name'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.merchantName
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'mobile'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.merchantMobile
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'email'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.merchantUserEmail
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'recipient_info'.tr,
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: kGreyTextColor.withOpacity(0.5),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            'name'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.customerName
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'phone'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.customerPhone
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            child: Text(
                                              'address'.tr + ':',
                                              style: kTextStyle.copyWith(
                                                  color: kTitleColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Flexible(
                                              child: Text(
                                            widget.parcel.customerAddress
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ],
                                      ),
                                      const SizedBox(height: 30.0),
                                      Text(
                                        'parcel_info'.tr,
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: kGreyTextColor.withOpacity(0.5),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            'tracking_id'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.trackingId.toString(),
                                            style: kTextStyle.copyWith(
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'delivery_type'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.deliveryType
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'pickup_time'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.pickupDate.toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'delivery_time'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            widget.parcel.deliveryDate
                                                .toString(),
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'total_charge_amount'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${widget.parcel.totalDeliveryAmount}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'vat_amount'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${widget.parcel.vatAmount}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'current_payable'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${widget.parcel.currentPayable}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          Text(
                                            'cash_collection'.tr + ':',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${Get.find<GlobalController>().currency!}${widget.parcel.cashCollection}',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      const SizedBox(height: 30.0),
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.844,
                                              child: SingleChildScrollView(
                                                  child: parcelLogs.loaderLogs
                                                      ? ParcelLogsShimmer()
                                                      : Column(
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                child:
                                                                    SingleChildScrollView(
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        child: ListView
                                                                            .builder(
                                                                          itemCount: parcelLogs
                                                                              .parcelLogsList
                                                                              .length,
                                                                          shrinkWrap:
                                                                              true,
                                                                          physics:
                                                                              const NeverScrollableScrollPhysics(),
                                                                          itemBuilder:
                                                                              (_, i) {
                                                                            return TimelineTile(
                                                                              alignment: TimelineAlign.manual,
                                                                              lineXY: 0.35,
                                                                              indicatorStyle: IndicatorStyle(
                                                                                  indicator: Icon(
                                                                                    Icons.check_circle,
                                                                                    color: kMainColor,
                                                                                  ),
                                                                                  color: kMainColor,
                                                                                  padding: const EdgeInsets.only(bottom: 4.0)),
                                                                              startChild: Padding(
                                                                                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      '${parcelLogs.parcelLogsList[i].date} ',
                                                                                      style: kTextStyle.copyWith(color: kTitleColor),
                                                                                    ),
                                                                                    Text(
                                                                                      '${parcelLogs.parcelLogsList[i].timeDate} ',
                                                                                      style: kTextStyle.copyWith(color: kGreyTextColor, fontSize: 14.0),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              endChild: Padding(
                                                                                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      '${parcelLogs.parcelLogsList[i].parcelStatusName}',
                                                                                      style: kTextStyle.copyWith(color: Colors.green),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    parcelLogs.parcelLogsList[i].hubName == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'hub_name'.tr + ': ${parcelLogs.parcelLogsList[i].hubName} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].hubPhone == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'hub_phone'.tr + ': ${parcelLogs.parcelLogsList[i].hubPhone} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].deliveryMan == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'delivery_man'.tr + ': ${parcelLogs.parcelLogsList[i].deliveryMan} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].deliveryPhone == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'delivery_phone'.tr + ': ${parcelLogs.parcelLogsList[i].deliveryPhone} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].transferDeliveryMan == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'delivery_man'.tr + ': ${parcelLogs.parcelLogsList[i].transferDeliveryMan} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].transferDeliveryPhone == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'delivery_phone'.tr + ': ${parcelLogs.parcelLogsList[i].transferDeliveryPhone} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].pickupMan == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'pickup_man'.tr + ': ${parcelLogs.parcelLogsList[i].pickupMan} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].pickupPhone == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'pickup_phone'.tr + ': ${parcelLogs.parcelLogsList[i].pickupPhone} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    parcelLogs.parcelLogsList[i].description == ''
                                                                                        ? SizedBox()
                                                                                        : Text(
                                                                                            'note'.tr + ': ${parcelLogs.parcelLogsList[i].description} ',
                                                                                            style: kTextStyle.copyWith(color: kGreyTextColor),
                                                                                          ),
                                                                                    Text(
                                                                                      '${parcelLogs.parcelLogsList[i].date} ',
                                                                                      style: kTextStyle.copyWith(color: kTitleColor),
                                                                                    ),
                                                                                    Text(
                                                                                      '${parcelLogs.parcelLogsList[i].timeDate} ',
                                                                                      style: kTextStyle.copyWith(color: kGreyTextColor, fontSize: 14.0),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 40.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              beforeLineStyle: const LineStyle(
                                                                                color: kMainColor,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ))),
                                                            TimelineTile(
                                                              alignment:
                                                                  TimelineAlign
                                                                      .manual,
                                                              lineXY: 0.35,
                                                              indicatorStyle:
                                                                  IndicatorStyle(
                                                                      indicator:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color:
                                                                            kMainColor,
                                                                      ),
                                                                      color:
                                                                          kMainColor,
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              4.0)),
                                                              startChild:
                                                                  Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            20.0,
                                                                        left:
                                                                            10.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      '${parcelLogs.parcel.createdAt} ',
                                                                      style: kTextStyle.copyWith(
                                                                          color:
                                                                              kTitleColor),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              endChild: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            20.0,
                                                                        left:
                                                                            10.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'parcel_create'
                                                                          .tr,
                                                                      style: kTextStyle.copyWith(
                                                                          color:
                                                                              Colors.green),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      'name'.tr +
                                                                          ': ${parcelLogs.parcel.merchantName} ',
                                                                      style: kTextStyle.copyWith(
                                                                          color:
                                                                              kGreyTextColor),
                                                                    ),
                                                                    Text(
                                                                      'email'.tr +
                                                                          ': ${parcelLogs.parcel.customerName} ',
                                                                      style: kTextStyle.copyWith(
                                                                          color:
                                                                              kGreyTextColor),
                                                                    ),
                                                                    Text(
                                                                      'mobile'.tr +
                                                                          ': ${parcelLogs.parcel.merchantMobile} ',
                                                                      style: kTextStyle.copyWith(
                                                                          color:
                                                                              kGreyTextColor),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          40.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              beforeLineStyle:
                                                                  const LineStyle(
                                                                color:
                                                                    kMainColor,
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        )
                      ]),
                ),
              )),
    );
  }
}
