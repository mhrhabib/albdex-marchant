import '/Screen/Payment/PaymentRequest/payment_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Widgets/button_global.dart';
import '../../Widgets/constant.dart';


class AddPaymentRequest extends StatefulWidget {
  const AddPaymentRequest({Key? key}) : super(key: key);

  @override
  _AddPaymentRequestState createState() => _AddPaymentRequestState();
}

class _AddPaymentRequestState extends State<AddPaymentRequest> {
  List<String> item = [
    'Select Merchant Account',
    'Riaz Uddin,Bank Asia Ltd',
    'Riaz Uddin,Bank Asia Limited',
    'Riaz Uddin,Bank Islami Ltd.',
    'Riaz Uddin,Bank City Ltd.',
  ];
  String selectedItem = 'Select Merchant Account';
  DropdownButton<String> getMethod() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in item) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des,maxLines: 5,),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectedItem,
      onChanged: (value) {
        setState(() {
          selectedItem = value!;
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
          'Add Payment Request',
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
      body: SingleChildScrollView(
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
                  const SizedBox(height: 20),
                  AppTextField(
                    showCursor: true,
                    cursorColor: kTitleColor,
                    textFieldType: TextFieldType.NAME,
                    decoration: kInputDecoration.copyWith(
                      labelText: 'Amount'+'*',
                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                      hintText: 'Select an amount',
                      hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  InputDecorator(
                    decoration: InputDecoration(
                      contentPadding:  EdgeInsets.only(left: 10.0),
                      labelText: 'Account',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0,
                              color: kGreyTextColor.withOpacity(0.15))),
                    ),
                    child: ListTile(
                      title: DropdownButtonHideUnderline(
                        child: getMethod(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    showCursor: true,
                    cursorColor: kTitleColor,
                    textFieldType: TextFieldType.PHONE,
                    decoration: kInputDecoration.copyWith(
                      labelText: 'Description',
                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                      hintText: 'Enter your description',
                      hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ButtonGlobal(
                      buttontext: 'create'.tr,
                      buttonDecoration: kButtonDecoration,
                      onPressed: () {
                        const PaymentReq().launch(context);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
