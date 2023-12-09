import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../constant.dart';
import 'package:shimmer/shimmer.dart';

class ParcelLogsShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParcelLogsShimmerState();
  }
}

class _ParcelLogsShimmerState extends State<ParcelLogsShimmer> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return   Padding(
        padding: const EdgeInsets.all(0),
        child:SingleChildScrollView(
            child:
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return  Shimmer.fromColors(
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    child:
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.35,
                  isFirst: true,
                  indicatorStyle: const IndicatorStyle(
                      indicator: Icon(
                        Icons.check_circle,
                        color: kMainColor,
                      ),
                      color: kMainColor,
                      padding: EdgeInsets.only(bottom: 4.0)),
                  startChild: Shimmer.fromColors(
                highlightColor: Colors.grey[400]!,
                baseColor: Colors.grey[300]!,
                child:
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '21 July, 2022',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        Text(
                          '10:21 am',
                          style: kTextStyle.copyWith(
                              color: kGreyTextColor,
                              fontSize: 14.0),
                        ),
                      ],
                    ),
                  )),
                  endChild: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'confirmed'.tr,
                          style: kTextStyle.copyWith(
                              color: kTitleColor),
                        ),
                        Text(
                          'we_got_your_parcel_here'.tr,
                          style: kTextStyle.copyWith(
                              color: kGreyTextColor),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  beforeLineStyle: const LineStyle(
                    color: kMainColor,
                  ),
                ));
              },
            )));
  }
}