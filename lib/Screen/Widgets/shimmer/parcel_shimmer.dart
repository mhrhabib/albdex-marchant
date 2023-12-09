import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:shimmer/shimmer.dart';

class ParcelShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParcelShimmerState();
  }
}

class _ParcelShimmerState extends State<ParcelShimmer> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return  Padding(
        padding: const EdgeInsets.all(0),
        child:SingleChildScrollView(
            child:
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    child:
                  Card(
                    child: ListTile(
                      onTap: () {
                      },
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      minLeadingWidth: 0,
                      leading: Text(
                        '',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontSize: 18),
                      ),
                      title: Text(
                        '',
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                      subtitle: Text(
                        '',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                  ));
              },
            )));
  }
}