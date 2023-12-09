import '/Controllers/statement_controller.dart';
import '/Screen/Widgets/shimmer/farud_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Widgets/constant.dart';

class Statement extends StatefulWidget {
  const Statement({Key? key}) : super(key: key);

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
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
    'income'.tr,
    'expense'.tr,
  ];
  String typeSelect = 'income'.tr;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'Statements'.tr,
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              FeatherIcons.x,
              color: kTitleColor,
            ).onTap(
              () => Navigator.pop(context),
            ),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body: GetBuilder<StatementController>(
          init: StatementController(),
          builder: (statement) {
            return statement.loader
                ? FarudShimmer()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30.0),
                        Container(
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
                                                    color: kTitleColor,
                                                    size: 16.0,
                                                  ),
                                                  const SizedBox(width: 4.0),
                                                  Text(
                                                    'filter'.tr,
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
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
                                                  SizedBox(width: 4.0),
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
                                          contentPadding: const EdgeInsets.only(left: 10.0),
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
                                      InputDecorator(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(left: 10.0),
                                          labelText: 'type'.tr,
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: kGreyTextColor.withOpacity(0.15))),
                                        ),
                                        child: ListTile(
                                          title: DropdownButtonHideUnderline(
                                            child: setType(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      AppTextField(
                                        showCursor: true,
                                        cursorColor: kTitleColor,
                                        textFieldType: TextFieldType.PHONE,
                                        decoration: kInputDecoration.copyWith(
                                          labelText: 'tracking_id'.tr,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                          hintText: 'enter_tracking_id'.tr,
                                          hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
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
                                  itemCount: statement.statementList.length,
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
                                              statement.statementList[i].note ?? '',
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 20.0),
                                            Divider(
                                              thickness: 1.0,
                                              color: kGreyTextColor.withOpacity(0.2),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Text(
                                                  'date'.tr + ':',
                                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  statement.statementList[i].date ?? '',
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
                                                  'type'.tr + ':',
                                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  statement.statementList[i].typeName ?? '',
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
                                                  statement.statementList[i].amount ?? '',
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
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
