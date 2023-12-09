import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../Controllers/parcel_controller.dart';
import '../Widgets/constant.dart';
import '../Widgets/shimmer/parcel_log_shimmer.dart';
import '../Widgets/shimmer/parcel_shimmer.dart';

class ParcelLog extends StatefulWidget {
  final int? id;

  ParcelLog({Key? key, this.id}) : super(key: key);

  @override
  State<ParcelLog> createState() => _ParcelLogState();
}

class _ParcelLogState extends State<ParcelLog> {
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
        title: Text(
          'parcel_log'.tr,
          style: kTextStyle.copyWith(color: kDarkWhite),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              FeatherIcons.x,
              color: kDarkWhite,
            ).onTap(
              () => Navigator.pop(context),
            ),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kDarkWhite),
      ),
      body: GetBuilder<ParcelController>(
          init: ParcelController(),
          builder: (parcelLogs) => Column(
            children: [
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.844,
                        child: parcelLogs.loaderLogs
                            ? ParcelLogsShimmer()
                            : SingleChildScrollView(
                              child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Card(
                                              elevation: 10,
                                              color: kSecondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(2.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                                                child: Text(
                                                  '${parcelLogs.parcel.statusName}',
                                                  style: kTextStyle.copyWith(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            'merchant'.tr,
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
                                                'shop_name'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.merchantName}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'phone'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.merchantMobile}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'pickup_address'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.merchantAddress}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
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
                                                'tracking_id'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.trackingId}',
                                                style: kTextStyle.copyWith(color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'delivery_type'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.deliveryType}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'pickup_time'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.pickupDate}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'delivery_time'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.deliveryDate}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'total_charge_amount'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.totalDeliveryAmount}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'vat_amount'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.vatAmount}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'current_payable'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.currentPayable}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              Text(
                                                'cash_collection'.tr+':',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor, fontWeight: FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${parcelLogs.parcel.cashCollection}',
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 15.0),
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 2,),
                                    Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: ListView.builder(
                                          itemCount: parcelLogs.parcelLogsList.length,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemBuilder: (_, i) {
                                            return TimelineTile(
                                              alignment: TimelineAlign.manual,
                                              lineXY: 0.35,
                                              indicatorStyle: IndicatorStyle(
                                                  indicator: Icon(
                                                    Icons.check_circle,
                                                    color: kMainColor,
                                                  ),
                                                  color: kMainColor,
                                                  padding: const EdgeInsets.only(
                                                      bottom: 4.0)),
                                              startChild: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0, left: 10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '${parcelLogs.parcelLogsList[i].date} ',
                                                      style: kTextStyle.copyWith(
                                                          color: kTitleColor),
                                                    ),
                                                    Text(
                                                      '${parcelLogs.parcelLogsList[i].timeDate} ',
                                                      style: kTextStyle.copyWith(
                                                          color: kGreyTextColor,
                                                          fontSize: 14.0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              endChild: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0, left: 10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${parcelLogs.parcelLogsList[i].parcelStatusName}',
                                                      style: kTextStyle.copyWith(
                                                          color: Colors.green),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .hubName ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'hub_name'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].hubName} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .hubPhone ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'hub_phone'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].hubPhone} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .deliveryMan ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'delivery_man'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].deliveryMan} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .deliveryPhone ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'delivery_phone'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].deliveryPhone} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .transferDeliveryMan ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'delivery_man'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].transferDeliveryMan} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .transferDeliveryPhone ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'delivery_phone'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].transferDeliveryPhone} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .pickupMan ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'pickup_man'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].pickupMan} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .pickupPhone ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'pickup_phone'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].pickupPhone} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
                                                          ),
                                                    parcelLogs.parcelLogsList[i]
                                                                .description ==
                                                            ''
                                                        ? SizedBox()
                                                        : Text(
                                                            'note'.tr +
                                                                ': ${parcelLogs.parcelLogsList[i].description} ',
                                                            style: kTextStyle.copyWith(
                                                                color: kGreyTextColor),
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

                                            // TimelineTile(
                                            //   alignment: TimelineAlign.manual,
                                            //   lineXY: 0.35,
                                            //   isFirst: true,
                                            //   indicatorStyle: const IndicatorStyle(
                                            //       indicator: Icon(
                                            //         Icons.check_circle,
                                            //         color: kMainColor,
                                            //       ),
                                            //       color: kMainColor,
                                            //       padding: EdgeInsets.only(bottom: 4.0)),
                                            //   startChild: Padding(
                                            //     padding: const EdgeInsets.only(
                                            //         top: 20.0, left: 10.0),
                                            //     child: Column(
                                            //       crossAxisAlignment: CrossAxisAlignment.end,
                                            //       children: [
                                            //         Text(
                                            //           '21 July, 2022',
                                            //           style: kTextStyle.copyWith(color: kTitleColor),
                                            //         ),
                                            //         Text(
                                            //           '10:21 am',
                                            //           style: kTextStyle.copyWith(
                                            //               color: kGreyTextColor,
                                            //               fontSize: 14.0),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            //   endChild: Padding(
                                            //     padding: const EdgeInsets.only(
                                            //         top: 20.0, left: 10.0),
                                            //     child: Column(
                                            //       crossAxisAlignment: CrossAxisAlignment.start,
                                            //       children: [
                                            //         Text(
                                            //           'confirmed'.tr,
                                            //           style: kTextStyle.copyWith(
                                            //               color: kTitleColor),
                                            //         ),
                                            //         Text(
                                            //           'we_got_your_parcel_here'.tr,
                                            //           style: kTextStyle.copyWith(
                                            //               color: kGreyTextColor),
                                            //         ),
                                            //         const SizedBox(
                                            //           height: 20.0,
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            //   beforeLineStyle: const LineStyle(
                                            //     color: kMainColor,
                                            //   ),
                                            // );
                                          },
                                        )),
                                    TimelineTile(
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
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${parcelLogs.parcel.createdAt} ',
                                              style: kTextStyle.copyWith(
                                                  color: kTitleColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      endChild: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'parcel_create'.tr,
                                              style: kTextStyle.copyWith(
                                                  color: Colors.green),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'name'.tr +
                                                  ': ${parcelLogs.parcel.merchantName} ',
                                              style: kTextStyle.copyWith(
                                                  color: kGreyTextColor),
                                            ),
                                            Text(
                                              'email'.tr +
                                                  ': ${parcelLogs.parcel.customerName} ',
                                              style: kTextStyle.copyWith(
                                                  color: kGreyTextColor),
                                            ),
                                            Text(
                                              'mobile'.tr +
                                                  ': ${parcelLogs.parcel.merchantMobile} ',
                                              style: kTextStyle.copyWith(
                                                  color: kGreyTextColor),
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
                                    )
                                  ],
                                ),
                            ),
                      ),
                    ),
              ),
            ],
          )),
    );
  }
}
