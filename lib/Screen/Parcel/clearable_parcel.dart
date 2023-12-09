import '/Controllers/clearable_parcel_controller.dart';
import 'parcel_log.dart';
import '/Screen/Widgets/button_global.dart';
import '/Screen/Widgets/constant.dart';
import '/Screen/Widgets/shimmer/farud_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';


class ClearableParcels extends StatefulWidget {
  const ClearableParcels({Key? key}) : super(key: key);

  @override
  State<ClearableParcels> createState() => _ClearableParcelsState();
}

class _ClearableParcelsState extends State<ClearableParcels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Cleanable Parcels',
          style: kTextStyle.copyWith(color: kBgColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              FeatherIcons.x,
              color: kBgColor,
            ).onTap(
              () => Navigator.pop(context),
            ),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body: GetBuilder<ClearableParcelController>(
          init: ClearableParcelController(),
          builder: (request) {
            return Container(

                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),

                child: request.loader
                ? FarudShimmer()
                : request.parcelList.isNotEmpty? ListView.builder(
                  itemCount: request.parcelList.length+1,
                  itemBuilder: (_, i) {

                    if(i==request.parcelList.length){
                      return request.currentPage <request.lastPage? ButtonGlobal(
                          buttontext: 'Load More'.tr,
                          buttonDecoration: kButtonDecoration.copyWith(boxShadow:  [BoxShadow(color: Colors.black.withOpacity(.2),blurRadius: 5,offset: Offset(0,2))]),
                          onPressed: () {
                            request.getNextParcelList();
                          }) : SizedBox();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child:Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InkWell(
                          onTap: (){
                            ParcelLog(id: request.parcelList[i].id!).launch(context);
                          },
                          child: Card(
                            color: kBgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("#${request.parcelList[i].trackingId}"),
                                      Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                          decoration: BoxDecoration(
                                              color:Colors.grey.withOpacity(.5),
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Text("${request.parcelList[i].statusName}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text("${request.parcelList[i].customerName}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                  SizedBox(height: 3,),
                                  Text("${request.parcelList[i].customerPhone}",style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Cash Collection: ${request.parcelList[i].cashCollection}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                                      Text("Current Payable: ${request.parcelList[i].currentPayable}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ):Center(child: Text("No data found!"),));
          }),
    );
  }
}
