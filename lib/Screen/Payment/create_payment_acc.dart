import '/Controllers/payment_account_controller.dart';
import '/Screen/Widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Widgets/constant.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc({Key? key}) : super(key: key);

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  List<String> item = ['select_payment_method'.tr, 'mobile'.tr, 'phone'.tr, 'bank'.tr];
  String froms = 'select_payment_method'.tr;

  DropdownButton<String> getMethod() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in item) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: froms,
      onChanged: (value) {
        setState(() {
          froms = value!;
        });
      },
    );
  }

  List<String> bank = [
    'Ab Bank Ltd',
    'Agrani Bank Ltd',
    'Bank Asia Ltd',
    'Brac Bank Ltd',
    'City Bank Ltd',
  ];
  String selectBank = 'Ab Bank Ltd';

  DropdownButton<String> addBank() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in bank) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectBank,
      onChanged: (value) {
        setState(() {
          selectBank = value!;
        });
      },
    );
  }

  PaymentAccountController paymentAccountController = PaymentAccountController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController holderNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController routingNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'create_payment_accounts'.tr,
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
      body: GetBuilder<PaymentAccountController>(
          init: PaymentAccountController(),
          builder: (account) {
            return account.loader ? Center(child: CircularProgressIndicator(),): SingleChildScrollView(
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
                        InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            labelText: 'payment_method'.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: kGreyTextColor.withOpacity(0.15))),
                          ),
                          child: ListTile(
                            title: DropdownButtonHideUnderline(
                              child: getMethod(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10.0),
                            labelText: 'select_bank'.tr + '*',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: kGreyTextColor.withOpacity(0.15))),
                          ),
                          child: ListTile(
                            title: DropdownButtonHideUnderline(
                              child: addBank(),
                            ),
                          ),
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                AppTextField(
                                  showCursor: true,
                                  cursorColor: kTitleColor,
                                  validator: (value) {
                                    if (holderNameController.text.isEmpty) {
                                      return "this_field_can_t_be_empty".tr;
                                    }
                                    return null;
                                  },
                                  controller: holderNameController,
                                  textFieldType: TextFieldType.NAME,
                                  decoration: kInputDecoration.copyWith(
                                    labelText: 'holder_name'.tr + '*',
                                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                    hintText: 'enter_holder_name'.tr,
                                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                AppTextField(
                                  showCursor: true,
                                  controller: accountNumberController,
                                  validator: (value) {
                                    if (accountNumberController.text.isEmpty) {
                                      return "this_field_can_t_be_empty".tr;
                                    }
                                    return null;
                                  },
                                  cursorColor: kTitleColor,
                                  textFieldType: TextFieldType.PHONE,
                                  decoration: kInputDecoration.copyWith(
                                    labelText: 'account_number'.tr + '*',
                                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                    hintText: 'enter_acc_no'.tr,
                                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                AppTextField(
                                  showCursor: true,
                                  controller: branchNameController,
                                  validator: (value) {
                                    if (branchNameController.text.isEmpty) {
                                      return "this_field_can_t_be_empty".tr;
                                    }
                                    return null;
                                  },
                                  cursorColor: kTitleColor,
                                  textFieldType: TextFieldType.NAME,
                                  decoration: kInputDecoration.copyWith(
                                    labelText: 'branch_name'.tr + '*',
                                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                    hintText: 'enter_branch_name'.tr,
                                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                AppTextField(
                                  showCursor: true,
                                  controller: routingNumberController,
                                  validator: (value) {
                                    if (routingNumberController.text.isEmpty) {
                                      return "this_field_can_t_be_empty".tr;
                                    }
                                    return null;
                                  },
                                  cursorColor: kTitleColor,
                                  textFieldType: TextFieldType.PHONE,
                                  decoration: kInputDecoration.copyWith(
                                    labelText: 'routing_no'.tr + '*',
                                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                    hintText: 'enter_routing_no'.tr,
                                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 30),
                        ButtonGlobal(
                            buttontext: 'create'.tr,
                            buttonDecoration: kButtonDecoration,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                paymentAccountController.paymentAccountPost(froms, selectBank,holderNameController.text,accountNumberController.text,branchNameController.text,routingNumberController.text);
                              }
                            })
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
