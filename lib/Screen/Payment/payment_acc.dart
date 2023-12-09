import '/Screen/Payment/create_payment_acc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Controllers/payment_account_controller.dart';
import '../Widgets/constant.dart';
import '../Widgets/shimmer/farud_shimmer.dart';

class PaymentAcc extends StatefulWidget {
  const PaymentAcc({Key? key}) : super(key: key);

  @override
  State<PaymentAcc> createState() => _PaymentAccState();
}

class _PaymentAccState extends State<PaymentAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'payment_accounts'.tr,
          style: kTextStyle.copyWith(color: kBgColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              FeatherIcons.plus,
              color: kBgColor,
            ).onTap(
                    () => const CreateAcc().launch(context)
            ),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body: GetBuilder<PaymentAccountController>(
          init: PaymentAccountController(),
          builder: (account){
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
                child: account.loader ? FarudShimmer() : account.accountList.isNotEmpty? ListView.builder(
                    itemCount: account.accountList.length,
                    itemBuilder: (_, index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kBgColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                elevation: 10,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'payment_method'.tr+':',
                                              style: kTextStyle.copyWith(
                                                  color: kTitleColor),
                                            ),
                                            const Spacer(),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 5.0,
                                                  bottom: 5.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20.0),
                                                color: kMainColor,
                                              ),
                                              child: Text(
                                                '${account.accountList[index].paymentMethodName ?? ''}'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kBgColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Text(
                                    'bank_name'.tr+':*',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    account.accountList[index].bankName ?? '',
                                    style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Text(
                                    'holder_name'.tr+'*:',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    account.accountList[index].holderName ?? '',
                                    style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Text(
                                    'account_no'.tr+':*',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    account.accountList[index].accountNo ?? '',
                                    style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Text(
                                    'branch_name'.tr+':*',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    account.accountList[index].branchName ?? '',
                                    style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }):Center(child: Text("No data found!"))
            );
          }),
    );
  }
}