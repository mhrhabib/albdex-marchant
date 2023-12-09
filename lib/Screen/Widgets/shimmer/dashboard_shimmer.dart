import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../utils/image.dart';
import '../button_global.dart';
import '../constant.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardShimmerState();
  }
}

class _DashboardShimmerState extends State<DashboardShimmer> {
  var mainHeight, mainWidth;

  final iconList = <IconData>[
    FontAwesomeIcons.boxOpen,
    MdiIcons.truckFast,
    FontAwesomeIcons.dna,
    FontAwesomeIcons.dolly,
  ];

  List<Color> colorList = [
    const Color(0xFFEFFBF8),
    const Color(0xFFFDF9EE),
    const Color(0xFFFBEBF1),
    const Color(0xFFEFF5FA),
  ];

  List<String> reportList = [
    'total_parcel'.tr,
    'total_delivered'.tr,
    'total_return'.tr,
    'total_transit'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color(0xFFf9f9fe),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Shimmer.fromColors(
          highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: null,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: 1,
                itemBuilder:
                    (BuildContext context, int index, int realIndex) {
                  return Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.banner1),
                      ),
                    ),
                  );
                },
              )),
              const SizedBox(height: 10),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                elevation: 10,
                color: Colors.white,
                shadowColor: kMainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '',
                        style: kTextStyle.copyWith(
                          color: kTitleColor,
                        ),
                        maxLines: 5,
                      ),
                      Center(
                        child: Container(
                          height: 120,
                          width: 250,
                          decoration:  BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(Images.giftBox),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ButtonGlobal(
                          buttontext: '',
                          buttonDecoration: kButtonDecoration,
                          onPressed: () {})
                    ],
                  ),
                ),
              )),
              const SizedBox(height: 20),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Text(
                'merchant_dashboard'.tr,
                style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
              const SizedBox(height: 10),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  4,
                      (i) {
                    return
                      Card(
                        color: colorList[i],
                        elevation: 10,
                        shadowColor: kMainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Icon(
                                iconList[i],
                                size: 40,
                                color: kTitleColor,
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                reportList[i],
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                  },
                ),
              )),
              const SizedBox(height: 20),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: kGreyTextColor.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'total_cash_collection'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                                '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'total_selling_price'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                                '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'net_profit_amount'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                                "0",
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: kGreyTextColor.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'total_liquid_fragile_amount'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                                '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'total_packing_amount'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                               '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'total_vat_amount'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                                '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'total_delivery_charge'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text('0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'total_cod_amount'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                               '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: kGreyTextColor.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'total_delivery_amount'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                                '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'total_current_payable_amount'.tr,
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                              const Spacer(),
                              Text(
                                '0',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 20),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Text(
                'all_reports'.tr,
                style: kTextStyle.copyWith(
                    color: kGreyTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.handHoldingDollar,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'total_sales_amount'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.handshakeAngle,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'total_delivery_fees_paid'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.coins,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'net_profit_amount'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "0",
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.creditCard,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'current_balance'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.circleDollarToSlot,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'opening_balance'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.dna,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'vat'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.hourglass,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'payment_processing'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                         '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.database,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'paid_amount'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.houseChimney,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'total_shop'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.boxesStacked,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'total_parcel_bank_item'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.clockRotateLeft,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'total_payment_request'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      FontAwesomeIcons.users,
                      color: kTitleColor,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'total_fraud_customer'.tr,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '0',
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      );
  }
}