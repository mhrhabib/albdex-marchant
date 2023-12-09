import '/Screen/Widgets/button_global.dart';
import '/Screen/Widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';

import '../../Controllers/shop_controller.dart';
import '../../utils/size_config.dart';
import '../Widgets/loader.dart';

class CreateShops extends StatefulWidget {
  const CreateShops({Key? key}) : super(key: key);

  @override
  State<CreateShops> createState() => _CreateShopsState();
}

class _CreateShopsState extends State<CreateShops> {
  ShopController shopController = ShopController();
  final _formKey = GlobalKey<FormState>();
  String status = 'active'.tr;
  List<String> selectStatus = [
    'active'.tr,
    'inactive'.tr,
  ];

  DropdownButton<String> selectStatusDrop() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in selectStatus) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: status,
      onChanged: (value) {
        setState(() {
          status = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigCustom sizeConfig = SizeConfigCustom();
    sizeConfig.init(context);
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'create_shop'.tr,
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
      GetBuilder<ShopController>(
    init: ShopController(),
    builder: (shop) =>
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
                      controller: shop.nameController,
                      validator: (value) {
                        if (shop.nameController.text.isEmpty) {
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
                      controller: shop.phoneController,
                      validator: (value) {
                        if (shop.phoneController.text.isEmpty) {
                          return "this_field_can_t_be_empty".tr;
                        }
                        return null;
                      },
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.PHONE,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'mobile'.tr+'*',
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'enter_phone_number'.tr,
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: shop.addressController,
                      validator: (value) {
                        if (shop.addressController.text.isEmpty) {
                          return "this_field_can_t_be_empty";
                        }
                        return null;
                      },
                      cursorColor: kTitleColor,
                      textAlign: TextAlign.start,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'address'.tr+'*',
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60.0,
                      child: FormField(
                        builder: (FormFieldState<dynamic> field) {
                          return InputDecorator(
                            decoration: kInputDecoration.copyWith(
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              labelText: 'status'.tr+'*',
                              hintText: 'select_status'.tr,
                              labelStyle:
                              kTextStyle.copyWith(color: kTitleColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: selectStatusDrop(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30.0),
                   ButtonGlobal(buttontext: 'submit'.tr, buttonDecoration: kButtonDecoration, onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       shop.shopPost(status);
                     }
                   })
                  ],
                )),
              ),
            ),
          ],
        ),
      )),
    shop.loader
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
