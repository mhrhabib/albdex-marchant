
import '/Screen/Support/reply.dart';
import '/Screen/Support/support_add.dart';
import '/Screen/Support/support_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Controllers/supports_controller.dart';
import '../Widgets/constant.dart';
import '../Widgets/shimmer/farud_shimmer.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  SupportsController supportController = SupportsController();

  List<String> countData = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'support'.tr,
          style: kTextStyle.copyWith(color: kDarkWhite),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0), color: kBgColor),
                child: const Icon(
                  FeatherIcons.plus,
                  size: 18.0,
                  color: kTitleColor,
                )),
          ).onTap(
            () => const SupportAdd().launch(context),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kDarkWhite),
      ),
      body: GetBuilder<SupportsController>(
          init: SupportsController(),
          builder: (support){
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
              child: support.loader ? FarudShimmer() : support.supportList.isNotEmpty ?  ListView.builder(
                itemCount: support.supportList.length,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(1.0),
                                          color: kMainColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                                          child: Text(
                                            (i+1).toString(),
                                            style: kTextStyle.copyWith(color: Colors.white),
                                          ),
                                        )),
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
                                                    'view'.tr,
                                                    style: kTextStyle.copyWith(color: kTitleColor),
                                                  ),
                                                ],
                                              ).onTap(
                                                    () => Reply(supports: support.supportList[i],).launch(context),
                                              ),
                                              const SizedBox(height: 10.0),
                                              Row(
                                                children: [
                                                  const Icon(FontAwesomeIcons.solidPenToSquare, color: kTitleColor, size: 14.0),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    'edit'.tr,
                                                    style: kTextStyle.copyWith(color: kTitleColor),
                                                  ),
                                                ],
                                              ).onTap(
                                                      () => SupportEdit(supports: support.supportList[i],).launch(context)),
                                              const SizedBox(height: 10.0),
                                              Row(
                                                children: [
                                                   Icon(MdiIcons.delete, color: kTitleColor, size: 14.0),
                                                  const SizedBox(width: 5.0),
                                                  Text(
                                                    'delete'.tr,
                                                    style: kTextStyle.copyWith(color: kTitleColor),
                                                  ),
                                                ],
                                              ).onTap(() => supportController.supportDelete(support.supportList[i].id!)),
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
                                      'name'.tr + ':*',
                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      support.supportList[i].userName ?? '',
                                      style: kTextStyle.copyWith(color: kGreyTextColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Text(
                                      'email'.tr + ':',
                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      support.supportList[i].userName ?? 'Not Provided',
                                      style: kTextStyle.copyWith(color: kGreyTextColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Text(
                                      'department'.tr + ':',
                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${support.supportList[i].department ?? ''}'.tr + ':',
                                      style: kTextStyle.copyWith(color: kGreyTextColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Text(
                                      'service'.tr + ':',
                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${support.supportList[i].service ?? ''}'.tr,
                                      style: kTextStyle.copyWith(color: kGreyTextColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'subject'.tr + ':',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Text(
                                                    '${support.supportList[i].subject ?? ''}'.tr,
                                                    style: kTextStyle.copyWith(color: kSecondaryColor),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Text(
                                                support.supportList[i].date ?? '',
                                                style: kTextStyle.copyWith(color: kSecondaryColor, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ):Center(child: Text("No data found!"),),
            );
          }),
    );
  }
}
