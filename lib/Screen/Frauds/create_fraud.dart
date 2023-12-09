import '/Screen/Widgets/button_global.dart';
import '/Screen/Widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';


import '../../Controllers/fraud_controller.dart';
import '../../utils/size_config.dart';
import '../Widgets/loader.dart';

class CreateFrauds extends StatefulWidget {
  const CreateFrauds({Key? key}) : super(key: key);

  @override
  State<CreateFrauds> createState() => _CreateFraudsState();
}

class _CreateFraudsState extends State<CreateFrauds> {
  FraudController fraudController = FraudController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    SizeConfigCustom sizeConfig = SizeConfigCustom();
    sizeConfig.init(context);
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'create_fraud'.tr,
          style: kTextStyle.copyWith(color: kBgColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(FeatherIcons.x,color: kBgColor,).onTap(()=>finish(context))
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body:
      GetBuilder<FraudController>(
    init: FraudController(),
    builder: (fraud) =>
        Stack(children: [
        Center(
        child:
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Form(
                  key: _formKey,
                  child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    AppTextField(
                      showCursor: true,
                      controller: fraud.nameController,
                      validator: (value) {
                        if (fraud.nameController.text.isEmpty) {
                          return "this_field_can_t_be_empty".tr;
                        }
                        return null;
                      },
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.NAME,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'name'.tr+'*',
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'enter_name'.tr,
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      showCursor: true,
                      controller: fraud.phoneController,
                      validator: (value) {
                        if (fraud.phoneController.text.isEmpty) {
                          return "this_field_can_t_be_empty".tr;
                        }
                        return null;
                      },
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.PHONE,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'mobile'.tr,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'enter_phone_number'.tr,
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      showCursor: true,
                      controller: fraud.trackingIDController,
                      validator: (value) {
                        return null;
                      },
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.NAME,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'enter_tracking_id'.tr,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'enter_id'.tr,
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: fraud.detailsController,
                      validator: (value) {
                        if (fraud.detailsController.text.isEmpty) {
                          return "this_field_can_t_be_empty".tr;
                        }
                        return null;
                      },
                      cursorColor: kTitleColor,
                      textAlign: TextAlign.start,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'details'.tr+'*',
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                   ButtonGlobal(buttontext: 'submit'.tr, buttonDecoration: kButtonDecoration, onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       fraud.fraudPost();
                     }
                   })
                  ],
                )),
              ),
            ),
          ],
        ),
      )),
    fraud.loader
    ? Positioned(
    child: Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: Colors.white60,
    child: const Center(child: LoaderCircle())),
    )
        : const SizedBox.shrink(),
    ])
    ));
  }
}
