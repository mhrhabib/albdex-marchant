import '/Controllers/invoice_controller.dart';
import '/Models/invoice_detials_model.dart';
import '/Screen/Parcel/parcel_log.dart';
import '/Screen/Widgets/constant.dart';
import '/Screen/Widgets/shimmer/deliveryCharge_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({Key? key,required this.invoiceId}) : super(key: key);
  final int invoiceId;
  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'Invoice Details'.tr,
          style: kTextStyle.copyWith(color: kBgColor,fontWeight: FontWeight.w600),
        ),
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body: Container(
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
              child: FutureBuilder(
                future: InvoiceController().getInvoiceDetails(widget.invoiceId),
                builder: (context, AsyncSnapshot<InvoiceDetailsModel?> snapshot){
                  if(snapshot.data != null){
                    InvoiceDetailsModel invoiceDetails = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Text("ID: ${invoiceDetails.invoiceId}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                            SizedBox(height: 10,),
                            Text("Date: ${invoiceDetails.invoiceDate}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                            SizedBox(height: 5,),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                decoration: BoxDecoration(
                                    color:invoiceDetails.status == "PAID"? Colors.green.withOpacity(.3):Colors.grey.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Text("${invoiceDetails.status}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                            decoration: BoxDecoration(
                                color:Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: Text("Payment Info",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Amount Delivered",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Text("${invoiceDetails.totalDeliverdAmount!.toStringAsFixed(2)}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Payable Amount",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Text("${invoiceDetails.payableAmount}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(height: 10,),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text("Sub Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              //     Text("${invoiceDetails.totalReturnFee}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Return Fee",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Text("${invoiceDetails.totalReturnFee}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery Charge",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Text("${invoiceDetails.deliveryCharge}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                            decoration: BoxDecoration(
                                color:Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: Text("Recipient Info",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("${invoiceDetails.merchantName}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              SizedBox(height: 5,),
                              Text("${invoiceDetails.merchantPhone}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              SizedBox(height: 5,),
                              Text("${invoiceDetails.merchantAddress}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                            decoration: BoxDecoration(
                                color:Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: Text("Parcels",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: invoiceDetails.parcels!.data!.map((e){
                            return Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: InkWell(
                                onTap: (){
                                  ParcelLog(id: e.id!).launch(context);
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
                                            Text("#${e.trackingId}"),
                                            Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                                decoration: BoxDecoration(
                                                    color:Colors.grey.withOpacity(.5),
                                                    borderRadius: BorderRadius.circular(4)
                                                ),
                                                child: Text("${e.status}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Cash Collection: ${e.cashCollection}",style: TextStyle(fontWeight: FontWeight.w700),),
                                            Text("Charge: ${e.deliveryCharge}",style: TextStyle(fontWeight: FontWeight.w700),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    );
                  }else{
                    return DeliveryChargeShimmer();
                  }

                },
              ),
            )
          )
      ),
    );
  }
}
