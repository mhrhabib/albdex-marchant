import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../constant.dart';
import 'package:shimmer/shimmer.dart';

class ShopShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopShimmerState();
  }
}

class _ShopShimmerState extends State<ShopShimmer> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return  ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i) {
        return
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Shimmer.fromColors(
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    child:
                    Card(
                      color: kBgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Material(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5.0),
                              ),
                              elevation: 0.5,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(10.0),
                                      child:
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '' ,
                                            style: kTextStyle.copyWith(color: kTitleColor),
                                          ),
                                          const Spacer(),
                                          const Icon(FontAwesomeIcons.penToSquare,
                                              color: kTitleColor, size: 16.0).onTap(()=> print('')),
                                          const SizedBox(width: 20.0),
                                          const Icon(FontAwesomeIcons.trash,
                                              color: kTitleColor, size: 16.0)
                                              .onTap(
                                                () => print(''),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Text(
                                  'name'.tr+':',
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  '',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Text(
                                  'contact'.tr+':',
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  '',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Text(
                                  'address'.tr+':',
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  '',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          );
      },
    );

  }
}