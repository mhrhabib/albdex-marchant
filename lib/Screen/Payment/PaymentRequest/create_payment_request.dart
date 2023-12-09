import '/Controllers/payment_account_controller.dart';
import '/Controllers/payment_request_controller.dart';
import '/Models/balance_detials_model.dart';
import '/Models/payment_account_list_model.dart';
import '/Screen/Widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Widgets/constant.dart';

class CreatePaymentRequest extends StatefulWidget {
  const CreatePaymentRequest({Key? key,required this.balanceDetails}) : super(key: key);
  final BalanceDetailsModel balanceDetails;
  @override
  State<CreatePaymentRequest> createState() => _CreatePaymentRequestState();
}

class _CreatePaymentRequestState extends State<CreatePaymentRequest> {
  List<String> item = ['select_payment_method'.tr, 'mobile'.tr, 'phone'.tr, 'bank'.tr];
  Accounts? selectedAccount;

  DropdownButton<Accounts> getAccounts(List<Accounts> accounts) {
    List<DropdownMenuItem<Accounts>> dropDownItems = [];
    for (Accounts account in accounts) {
      var item = DropdownMenuItem(
        value: account,
        child: account.paymentMethod=="cash"?Text("${account.paymentMethodName}"):Text("${account.holderName}, ${account.bankName} (${account.accountNo})"),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectedAccount,
      hint: Text("Select Payment Account"),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          selectedAccount = value!;
        });
      },
    );
  }

  PaymentAccountController paymentAccountController = PaymentAccountController();
  PaymentRequestController paymentRequestController = PaymentRequestController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'Create Payment Request'.tr,
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
          builder: (accountController) {
            return accountController.loader ? Center(child: CircularProgressIndicator(),): SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
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
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text("Available Balance : ",style:TextStyle(fontSize: 20,color: kTitleColor,fontWeight: FontWeight.w700,)),
                            Text("${widget.balanceDetails.availableBalance!.toStringAsFixed(2)}",style:TextStyle(fontSize: 20,color: kTitleColor,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 15,),
                        InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            labelText: 'account'.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: kGreyTextColor.withOpacity(0.15))),
                          ),
                          child: ListTile(
                            title: DropdownButtonHideUnderline(
                              child: getAccounts(accountController.accountList),
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
                                    if (amountController.text.isEmpty) {
                                      return "amount".tr;
                                    }
                                    return null;
                                  },
                                  controller: amountController,
                                  textFieldType: TextFieldType.NUMBER,
                                  decoration: kInputDecoration.copyWith(
                                    labelText: 'amount'.tr + '*',
                                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                    hintText: 'amount'.tr,
                                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                AppTextField(
                                  showCursor: true,
                                  controller: descriptionController,
                                  validator: (value) {
                                    // if (descriptionController.text.isEmpty) {
                                    //   return "description".tr;
                                    // }
                                    return null;
                                  },
                                  cursorColor: kTitleColor,
                                  textFieldType: TextFieldType.OTHER,
                                  decoration: kInputDecoration.copyWith(
                                    labelText: 'description'.tr,
                                    labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                    hintText: 'description'.tr,
                                    hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 30),
                        ButtonGlobal(
                            buttontext: 'Create'.tr,
                            buttonDecoration: kButtonDecoration,
                            onPressed: () {
                              if (_formKey.currentState!.validate() && selectedAccount!=null) {
                                paymentRequestController.paymentRequestPost(amountController.text.toDouble(), selectedAccount!.id!,descriptionController.text);
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
