import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Controllers/codCharge_controller.dart';
import 'Widgets/constant.dart';
import 'Widgets/shimmer/codCharge_shimmer.dart';

class CodChargeList extends StatefulWidget {
  const CodChargeList({Key? key}) : super(key: key);

  @override
  State<CodChargeList> createState() => _CodChargeListState();
}

class _CodChargeListState extends State<CodChargeList> {

  List<Color> colorList = [
    const Color(0xFFEFFBF8),
    const Color(0xFFFDF9EE),
    const Color(0xFFFBEBF1),
    const Color(0xFFEFF5FA),
  ];
  int j =0;
  int count = 1;
  CodChargeController codChargeController = CodChargeController();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          title: Text(
            'cod_charge'.tr,
            style: kTextStyle.copyWith(color: kBgColor),
          ),
          backgroundColor: kMainColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: kBgColor),
        ),
        body:  GetBuilder<CodChargeController>(
        init: CodChargeController(),
    builder: (codCharge) =>
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child:
                codCharge.loader
                    ? CodChargeShimmer()
                    :
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
                                codCharge.codChargesList.length,
                                    (i) {
                                  if(i == 2){
                                    j = 0;
                                  } else {
                                    j += 1;
                                  }
                                  return
                                    Card(
                                      color: colorList[j],
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
                                              codCharge.codChargesList[i].name.toString(),
                                              style: kTextStyle.copyWith(
                                                  color: kTitleColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Text(
                                              codCharge.codChargesList[i].charge.toString() +' ( % )',
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
                            ),
                          ),
                           SizedBox(height: MediaQuery.of(context).size.height / 2.5),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
