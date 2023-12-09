import '/Screen/Shops/create_shop.dart';
import '/Screen/Shops/edit_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../Controllers/shop_controller.dart';
import '../Widgets/constant.dart';
import 'package:get/get.dart';

import '../Widgets/shimmer/shop_shimmer.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsState();
}

class _ShopsState extends State<ShopsPage> {
  ShopController shopController = ShopController();

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
                    'do_you_want_to_delete_the_shops'.tr,
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
                            ).onTap(() =>shopController.shopDelete(id))),
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
          'shops'.tr,
          style: kTextStyle.copyWith(
              color: kBgColor, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: kBgColor),
                child: const Icon(
                  FeatherIcons.plus,
                  size: 18.0,
                  color: Colors.black,
                )),
          ).onTap(
                () => const CreateShops().launch(context),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body:  GetBuilder<ShopController>(
          init: ShopController(),
          builder: (shop) =>
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: shop.loader ? ShopShimmer() : shop.shopList.isNotEmpty? ListView.builder(
                  itemCount: shop.shopList.length,
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
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Material(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                    ),
                                    elevation: 0.5,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(10.0),
                                            child:
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  shop.shopList[i].statusName.toString() ,
                                                  style: kTextStyle.copyWith(color: kTitleColor),
                                                ),
                                                const Spacer(),
                                                const Icon(FontAwesomeIcons.penToSquare,
                                                    color: kTitleColor, size: 16.0).onTap(()=> EditShops(shop:shop.shopList[i]).launch(context),),
                                                const SizedBox(width: 20.0),
                                                const Icon(FontAwesomeIcons.trash,
                                                    color: kTitleColor, size: 16.0)
                                                    .onTap(
                                                      () => showPopUp(shop.shopList[i].id.toString()),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text(
                                        'name'.tr+':',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        shop.shopList[i].name.toString(),
                                        style: kTextStyle.copyWith(
                                            color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        'contact'.tr+':',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        shop.shopList[i].contactNo.toString(),
                                        style: kTextStyle.copyWith(
                                            color: kGreyTextColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        child:
                                      Text(
                                        'address'.tr+':',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Flexible(child:
                                      Text(
                                        shop.shopList[i].address.toString(),
                                        style: kTextStyle.copyWith(
                                            color: kGreyTextColor),
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ) :Center(child: Text("No data found!"),),
              )
      ),
    );
  }
}