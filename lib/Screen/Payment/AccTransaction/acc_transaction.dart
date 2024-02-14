import '/Controllers/account_transaction_controller.dart';
import '/Screen/Widgets/shimmer/farud_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Widgets/constant.dart';

class AccTransaction extends StatefulWidget {
  const AccTransaction({Key? key}) : super(key: key);

  @override
  State<AccTransaction> createState() => _AccTransactionState();
}

class _AccTransactionState extends State<AccTransaction> {
  List<String> date = [
    'Today',
    'Yesterday',
    'Last 7 Days',
    'Last 30 Days',
    'This Month',
    'Last Month',
    'Custom Range',
  ];
  String selectDate = 'Today';

  DropdownButton<String> setDate() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in date) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectDate,
      onChanged: (value) {
        setState(() {
          selectDate = value!;
        });
      },
    );
  }

  List<String> type = [
    'Approval Status 1',
    'Approval Status 2',
    'Approval Status 3',
    'Approval Status 4',
    'Approval Status 5',
  ];
  String typeSelect = 'Approval Status 1';

  DropdownButton<String> setType() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in type) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: typeSelect,
      onChanged: (value) {
        setState(() {
          typeSelect = value!;
        });
      },
    );
  }

  List<String> acc = [
    'aaa (111 222 333)',
    'aaa (888 222 333)',
  ];
  String accSelect = 'aaa (111 222 333)';

  DropdownButton<String> setAcc() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in acc) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: accSelect,
      onChanged: (value) {
        setState(() {
          accSelect = value!;
        });
      },
    );
  }

  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'account_transaction'.tr,
          style: kTextStyle.copyWith(color: kDarkWhite),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              FeatherIcons.x,
              color: kDarkWhite,
            ).onTap(
              () => Navigator.pop(context),
            ),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kDarkWhite),
      ),
      body: GetBuilder<AccountTransactionController>(
          init: AccountTransactionController(),
          builder: (transaction) {
            return transaction.loader
                ? FarudShimmer()
                : Container(
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20.0),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kBgColor,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: kMainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.0),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(11),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2.0),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.filter,
                                                color: kBgColor,
                                                size: 16.0,
                                              ),
                                              const SizedBox(width: 4.0),
                                              Text(
                                                'filter'.tr,
                                                style: kTextStyle.copyWith(color: kBgColor, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Card(
                                        elevation: 10,
                                        color: kMainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.0),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(11),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2.0),
                                            color: kSecondaryColor,
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.eraser,
                                                color: Colors.white,
                                                size: 16.0,
                                              ),
                                              const SizedBox(width: 4.0),
                                              Text(
                                                'clear'.tr,
                                                style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10.0),
                                      labelText: 'date'.tr,
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: kGreyTextColor.withOpacity(0.15))),
                                    ),
                                    child: ListTile(
                                      title: DropdownButtonHideUnderline(
                                        child: setDate(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  // InputDecorator(
                                  //   decoration: InputDecoration(
                                  //     contentPadding: const EdgeInsets.only(left: 10.0),
                                  //     labelText: 'type'.tr,
                                  //     floatingLabelBehavior: FloatingLabelBehavior.always,
                                  //     border: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.circular(8.0),
                                  //     ),
                                  //     enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: kGreyTextColor.withOpacity(0.15))),
                                  //   ),
                                  //   child: ListTile(
                                  //     title: DropdownButtonHideUnderline(
                                  //       child: setType(),
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 20.0),
                                  InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(left: 10.0),
                                      labelText: 'account'.tr,
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: kGreyTextColor.withOpacity(0.15))),
                                    ),
                                    child: ListTile(
                                      title: DropdownButtonHideUnderline(
                                        child: setAcc(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: transaction.accountTransactionList.length,
                              itemBuilder: (_, i) {
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
                                        Text(
                                          'account_details'.tr,
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 20.0),
                                        Row(
                                          children: [
                                            Text(
                                              'bank_name'.tr + ':',
                                              style: kTextStyle.copyWith(color: kTitleColor),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].merchantAccount?.bankName ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              'holder_name'.tr + ':',
                                              style: kTextStyle.copyWith(color: kTitleColor),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].merchantAccount?.holderName ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              'account_no'.tr + ':',
                                              style: kTextStyle.copyWith(color: kTitleColor),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].merchantAccount?.accountNo ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text(
                                              'branch_name'.tr + ':',
                                              style: kTextStyle.copyWith(color: kTitleColor),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].merchantAccount?.branchName ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: kGreyTextColor.withOpacity(0.2),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Text(
                                              'trans_ID'.tr,
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].transactionId ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Divider(
                                          thickness: 1.0,
                                          color: kGreyTextColor.withOpacity(0.2),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Text(
                                              'request_date'.tr,
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].createdAt ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Divider(
                                          thickness: 1.0,
                                          color: kGreyTextColor.withOpacity(0.2),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Text(
                                              'status'.tr,
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].statusName ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Divider(
                                          thickness: 1.0,
                                          color: kGreyTextColor.withOpacity(0.2),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Text(
                                              'amount'.tr,
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              transaction.accountTransactionList[i].amount ?? '',
                                              style: kTextStyle.copyWith(color: kGreyTextColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
