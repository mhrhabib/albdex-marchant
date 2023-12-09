import '/Screen/Frauds/create_fraud.dart';
import '/Screen/Frauds/edit_frauds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Controllers/fraud_controller.dart';
import '../Widgets/constant.dart';
import 'package:get/get.dart';

import '../Widgets/shimmer/farud_shimmer.dart';

class Frauds extends StatefulWidget {
  const Frauds({Key? key}) : super(key: key);

  @override
  State<Frauds> createState() => _FraudsState();
}

class _FraudsState extends State<Frauds> {
  FraudController fraudController = FraudController();

  void showPopUp(id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    'do_you_want_to_delete_the_frauds'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: kMainColor),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'yes'.tr,
                                  style:
                                      kTextStyle.copyWith(color: kTitleColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ).onTap(() =>fraudController.fraudDelete(id))),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: kGreyTextColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'cancel'.tr,
                                style: kTextStyle.copyWith(color: kTitleColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ).onTap(
                            () => Get.back(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'frauds'.tr,
          style: kTextStyle.copyWith(
              color: kBgColor, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body:  GetBuilder<FraudController>(
      init: FraudController(),
    builder: (fraud) =>
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child:
          Column(
            children: [
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border:
                  Border.all(color: kGreyTextColor.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xFFFFF9ED),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 3,
                            child: AppTextField(
                              showCursor: false,
                              cursorColor: Colors.black,
                              textFieldType: TextFieldType.NAME,
                              decoration: kInputDecoration.copyWith(
                                fillColor: const Color(0xFFFFF9ED),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kGreyTextColor,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(5.0),
                                hintText: 'check_number'.tr,
                                hintStyle:
                                kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                color: kMainColor,
                              ),
                              child: const Icon(
                                FeatherIcons.search,
                                color: kBgColor,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: kMainColor,
                            ),
                            child: const Icon(
                              FontAwesomeIcons.clipboardList,
                              color: kBgColor,
                              size: 18.0,
                            ),
                          ).onTap(
                                () => fraud.getFraudList(),
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: kMainColor,
                            ),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: kBgColor,
                              size: 18.0,
                            ),
                          ).onTap(
                                () => const CreateFrauds().launch(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              fraud.loader
                  ? FarudShimmer()
                  :
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.62,
                child:
              SingleChildScrollView(
                          child:
                      ListView.builder(
                        itemCount: fraud.fraudList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, i) {
                          return (
                              Container(
                                padding: const EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 10),
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: kGreyTextColor.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'name'.tr + ': ${fraud.fraudList[i].name}' ,
                                            style: kTextStyle.copyWith(color: kTitleColor),
                                          ),
                                          const Spacer(),
                                          const Icon(FontAwesomeIcons.penToSquare,
                                              color: kTitleColor, size: 16.0).onTap(()=> EditFrauds(fraud:fraud.fraudList[i]).launch(context),),
                                          const SizedBox(width: 20.0),
                                          const Icon(FontAwesomeIcons.trash,
                                              color: kTitleColor, size: 16.0)
                                              .onTap(
                                                () => showPopUp(fraud.fraudList[i].id.toString()),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'phone:'.tr,
                                              style:
                                              kTextStyle.copyWith(color: kTitleColor),
                                              children: [
                                                TextSpan(
                                                    text: ' ${fraud.fraudList[i].phone}',
                                                    style: kTextStyle.copyWith(
                                                        color: kTitleColor,
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'date'.tr+':  ${fraud.fraudList[i].date}',
                                            style: kTextStyle.copyWith(color: kTitleColor),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: kGreyTextColor.withOpacity(0.2),
                                      ),
                                      Text(
                                        '${fraud.fraudList[i].description}',
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 10.0),
                                    ],
                                  ),
                                ),
                              )
                          );
                        },
                      )
              )),
            ],
          ),
        ),
      ),
    );
  }
}
