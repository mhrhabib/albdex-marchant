import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constant.dart';
import 'package:shimmer/shimmer.dart';

class CodChargeShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CodChargeShimmerState();
  }
}

class _CodChargeShimmerState extends State<CodChargeShimmer> {
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
            elevation: 2,
            shadowColor: kMainColor,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      10,
                          (i) {

                        return
                          Shimmer.fromColors(
                            highlightColor: Colors.grey[400]!,
                            baseColor: Colors.grey[300]!,
                            child:
                          Card(
                            color: Colors.grey[300],
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
                                    FontAwesomeIcons.mapLocationDot,
                                    size: 40,
                                    color: kTitleColor,
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'name'.tr,
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    '0 ( % )',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ));
                      },
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 2.5),
              ],
            ),
          ),

        ],
      );
  }
}