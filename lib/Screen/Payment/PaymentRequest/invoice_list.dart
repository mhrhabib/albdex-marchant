import '/Controllers/invoice_controller.dart';
import '/Screen/Payment/PaymentRequest/invoice_details.dart';
import '/Screen/Widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Widgets/constant.dart';
import '../../Widgets/shimmer/farud_shimmer.dart';

class InvoiceList extends StatefulWidget {
  const InvoiceList({Key? key}) : super(key: key);

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Payments',
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
      body: GetBuilder<InvoiceController>(
          init: InvoiceController(),
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
                : request.invoiceDetailsList.isNotEmpty? ListView.builder(
                  itemCount: request.invoiceDetailsList.length+1,
                  itemBuilder: (_, i) {

                    if(i==request.invoiceDetailsList.length){
                      return request.currentPage <request.lastPage? ButtonGlobal(
                          buttontext: 'Load More'.tr,
                          buttonDecoration: kButtonDecoration.copyWith(boxShadow:  [BoxShadow(color: Colors.black.withOpacity(.2),blurRadius: 5,offset: Offset(0,2))]),
                          onPressed: () {
                            request.getNextInvoiceList();
                          }) : SizedBox();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: InkWell(
                        onTap: (){
                          InvoiceDetails(invoiceId: request.invoiceDetailsList[i].id!).launch(context);
                        },
                        child: Card(
                          color: kBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("#${request.invoiceDetailsList[i].invoiceId}"),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                      decoration: BoxDecoration(
                                        color:request.invoiceDetailsList[i].status == "PAID"? Colors.green.withOpacity(.3):Colors.grey.withOpacity(.5),
                                        borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Text("${request.invoiceDetailsList[i].status}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${request.invoiceDetailsList[i].amount!.toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.w700),),
                                    Text("${request.invoiceDetailsList[i].invoiceDate}"),
                                  ],
                                ),
                              ],
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
