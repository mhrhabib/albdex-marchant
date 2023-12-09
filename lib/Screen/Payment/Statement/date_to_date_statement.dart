import '/Controllers/date_to_date_statement_controller.dart';
import '/Screen/Widgets/button_global.dart';
import '/Screen/Widgets/constant.dart';
import '/Screen/Widgets/shimmer/deliveryCharge_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DateToDateStatement extends StatefulWidget {
  const DateToDateStatement({Key? key}) : super(key: key);

  @override
  State<DateToDateStatement> createState() => _DateToDateStatementState();
}

class _DateToDateStatementState extends State<DateToDateStatement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'Statement'.tr,
          style: kTextStyle.copyWith(color: kBgColor,fontWeight: FontWeight.w600),
        ),
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body: GetBuilder<DateToDateStatementController>(
        init: DateToDateStatementController(),
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
              child: Column(
                children: [

                  Text("${controller.startDate.day}/${controller.startDate.month}/${controller.startDate.year}   to   ${controller.endDate.month}/${controller.endDate.day}/${controller.endDate.year}",style: kTextStyle.copyWith(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),

                  ButtonGlobal(buttontext: "Date Filter", buttonDecoration: kButtonDecoration, onPressed: ()async{
                    final picked = await showDateRangePicker(context: context,initialDateRange: DateTimeRange(start: controller.startDate, end: controller.endDate), firstDate: DateTime.now().subtract(Duration(days: 10000)), lastDate: DateTime.now());

                    if(picked!=null){
                      controller.startDate = picked.start;
                      controller.endDate = picked.end;
                    }
                  }),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: controller.loader? DeliveryChargeShimmer() : Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              Text("Parcel Count",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 18),),
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                decoration: BoxDecoration(
                                  color: kBorderColorTextField,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Delivered", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                        Text("${controller.statement.data!.parcelStatusWiseCount!.delivered}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Partial Delivered", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                        Text("${controller.statement.data!.parcelStatusWiseCount!.partialDelivered}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Return Received By Merchant", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                        Text("${controller.statement.data!.parcelStatusWiseCount!.returnReceivedByMerchant}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text("Cash Collection Info",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 18),),
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                decoration: BoxDecoration(
                                  color: kBorderColorTextField,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Cash Collection", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                        Text("${controller.statement.data!.cashCollectionInfo!.totalCashCollection} tk", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Payable To Merchant", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                        Text("${controller.statement.data!.payableToMerchant!.totalPayableMerchant!.toStringAsFixed(2)}tk", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Delivery Charge", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                        Text("${controller.statement.data!.profitInfo!.totalDeliveryCharge!.toStringAsFixed(2)} tk", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          );
        }
      ),
    );
  }
}
