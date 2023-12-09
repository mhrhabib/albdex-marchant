import '/Controllers/parcel_all_status_controller.dart';
import '/Screen/Parcel/status_wise_parcel.dart';
import '/Screen/Widgets/shimmer/deliveryCharge_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Widgets/constant.dart';

class ParcelAllStatus extends StatefulWidget {
  const ParcelAllStatus({Key? key}) : super(key: key);

  @override
  State<ParcelAllStatus> createState() => _ParcelAllStatusState();
}

class _ParcelAllStatusState extends State<ParcelAllStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'Parcel Category'.tr,
          style: kTextStyle.copyWith(color: kDarkWhite,fontWeight: FontWeight.w600),
        ),
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kDarkWhite),
      ),
      body: GetBuilder<ParcelAllStatusController>(
        init: ParcelAllStatusController(),
        builder: (controller) {

          return Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: controller.loader? DeliveryChargeShimmer() : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: controller.parcelAllStatus.map((e) => InkWell(
                      onTap: (){
                        StatusWiseParcel(parcelStatus: e).launch(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              children: [
                                Expanded(child: Text(e.status!,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),)),
                                Icon(Icons.arrow_forward_ios,size: 20,),
                              ],
                            ),
                          )
                        ),
                      ),
                    )
                    ).toList(),
                  ),
                ),
              )
          );
        }
      ),
    );
  }
}
