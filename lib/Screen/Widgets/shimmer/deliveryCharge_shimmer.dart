import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import 'package:shimmer/shimmer.dart';

class DeliveryChargeShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeliveryChargeShimmerState();
  }
}

class _DeliveryChargeShimmerState extends State<DeliveryChargeShimmer> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return
      Column(
        children: [
          const SizedBox(height: 20.0),
          Card(
            elevation: 1,
            shadowColor: kMainColor,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) {
                      return (
                          Shimmer.fromColors(
                              highlightColor: Colors.grey[400]!,
                              baseColor: Colors.grey[300]!,
                              child:
                          Card(
                        color: kBgColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(7.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.grey[400]!,
                            baseColor: Colors.grey[300]!,
                            child:
                                  Text(
                                    'laptop'.tr,
                                    style: kTextStyle.copyWith(
                                        color: Colors.grey[300]!,
                                        fontSize: 18.0,
                                        fontWeight:
                                        FontWeight.bold),
                                  )),
                                  const Spacer(),
                          Shimmer.fromColors(
                            highlightColor: Colors.grey[400]!,
                            baseColor: Colors.grey[300]!,
                            child:
                                  Container(
                                    padding:
                                    const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          2.0),
                                      color: Colors.grey[300]!,
                                    ),
                                    child: Text(
                                      'active'.tr,
                                      style: kTextStyle.copyWith(
                                          color: Colors.grey[300]!),
                                    ),
                                  )),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                            Shimmer.fromColors(
                              highlightColor: Colors.grey[400]!,
                              baseColor: Colors.grey[300]!,
                              child:
                              Row(
                                children: [
                                  Text(
                                    'weight'.tr+':',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '0',
                                    style: kTextStyle.copyWith(
                                      color: kGreyTextColor,
                                    ),
                                  )
                                ],
                              )),
                            Shimmer.fromColors(
                              highlightColor: Colors.grey[400]!,
                              baseColor: Colors.grey[300]!,
                              child:
                              Row(
                                children: [
                                  Text(
                                    'charge'.tr+':',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '60.00',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ))
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      );
  }
}