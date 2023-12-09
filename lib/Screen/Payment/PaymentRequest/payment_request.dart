import '/Controllers/payment_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Widgets/constant.dart';
import '../../Widgets/shimmer/farud_shimmer.dart';

class PaymentReq extends StatefulWidget {
  const PaymentReq({Key? key}) : super(key: key);

  @override
  State<PaymentReq> createState() => _PaymentReqState();
}

class _PaymentReqState extends State<PaymentReq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Payment Request List',
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
      body: GetBuilder<PaymentRequestController>(
          init: PaymentRequestController(),
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
                    : request.requestList.isNotEmpty? ListView.builder(
                  itemCount: request.requestList.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Card(
                            color: kBgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      PopupMenuButton(
                                        icon: const Icon(
                                          FeatherIcons.moreVertical,
                                          size: 16.0,
                                          color: kTitleColor,
                                        ),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (BuildContext bc) => [
                                          PopupMenuItem(
                                            value: "/Code",
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(FontAwesomeIcons.solidEye, color: kTitleColor, size: 14.0),
                                                    const SizedBox(width: 5.0),
                                                    Text(
                                                      'View',
                                                      style: kTextStyle.copyWith(color: kTitleColor),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10.0),
                                                Row(
                                                  children: [
                                                    const Icon(FontAwesomeIcons.solidPenToSquare, color: kTitleColor, size: 14.0),
                                                    const SizedBox(width: 5.0),
                                                    Text(
                                                      'Edit',
                                                      style: kTextStyle.copyWith(color: kTitleColor),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10.0),
                                                Row(
                                                  children: [
                                                     Icon(MdiIcons.delete, color: kTitleColor, size: 14.0),
                                                    const SizedBox(width: 5.0),
                                                    Text(
                                                      'Delete',
                                                      style: kTextStyle.copyWith(color: kTitleColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                        onSelected: (value) {
                                          Navigator.pushNamed(context, '$value');
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Acc. details:',
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        request.requestList[i].accountNo ?? '',
                                        style: kTextStyle.copyWith(color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Trans.ID:',
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        request.requestList[i].transactionId ?? '',
                                        style: kTextStyle.copyWith(color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Description:',
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        request.requestList[i].description ?? '',
                                        style: kTextStyle.copyWith(color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Request Date:',
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        request.requestList[i].requestDate ?? '',
                                        style: kTextStyle.copyWith(color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Status:',
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        request.requestList[i].statusName ?? '',
                                        style: kTextStyle.copyWith(color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Amount:',
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        request.requestList[i].amount ?? '',
                                        style: kTextStyle.copyWith(color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ):Center(child: Text("No data found!"),));
          }),
    );
  }
}