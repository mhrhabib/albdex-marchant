import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Parcel/parcel_all_staus.dart';
import '../Payment/AccTransaction/acc_transaction.dart';
import '../Payment/PaymentRequest/invoice_list.dart';
import '../Payment/PaymentRequest/payment_request.dart';
import '../Payment/Statement/date_to_date_statement.dart';
import '../Payment/balance_details.dart';
import '../Payment/payment_acc.dart';
import '../Support/support.dart';
import '../Widgets/button_global.dart';
import '/Controllers/dashboard_controller.dart';
import '/Screen/Frauds/frauds.dart';
import '/Screen/Home/home.dart';
import '/Screen/Parcel/parcel_index.dart';
import '/Screen/Shops/shops.dart';
import '/Screen/delivery_charges.dart';
import '/utils/image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../../Controllers/global-controller.dart';
import '../../Controllers/language_controller.dart';
import '../../Models/language_model.dart';
import '../../utils/style.dart';
import '../Widgets/constant.dart';
import '../Widgets/shimmer/dashboard_shimmer.dart';
import '../cod_charges.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  LanguageController languageController = Get.put(LanguageController());
  final box = GetStorage();
  Language? selectedLang;
  List<String> reportList = [
    'total_parcel'.tr,
    'total_delivered'.tr,
    'total_return'.tr,
    'total_transit'.tr,
  ];

  final iconList = <IconData>[
    FontAwesomeIcons.boxOpen,
    MdiIcons.truckFast,
    FontAwesomeIcons.dna,
    FontAwesomeIcons.dolly,
  ];

  List<Color> colorList = [
    const Color(0xFFEFFBF8),
    const Color(0xFFFDF9EE),
    const Color(0xFFFBEBF1),
    const Color(0xFFEFF5FA),
  ];
  List<String> imageList = [
    Images.banner1,
    Images.banner2,
    Images.banner3,
  ];

  DashboardController dashboardController = DashboardController();
  GlobalController globalController = GlobalController();
@override
  void initState() {
  FirebaseMessaging.instance
      .getInitialMessage()
      .then((RemoteMessage? message) {});

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      title: message.notification?.title,
      message: message.notification?.body,
      backgroundColor: kMainColor.withOpacity(.9),
      maxWidth: ScreenSize(context).mainWidth / 1.007,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    );
  });

  // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedLang =
    languageController.languageList[languageController.languageList.indexWhere((i) => i.locale == Get.locale)];

    return Scaffold(
      backgroundColor: kMainColor,
      drawer:
      Drawer(
        backgroundColor: kBgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kMainColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl:Get.find<GlobalController>().userImage ==null?'assets/images/profile.png':Get.find<GlobalController>().userImage.toString(),
                        imageBuilder: (context, imageProvider) =>
                            CircleAvatar(
                              radius: 25.0,
                              backgroundImage: imageProvider,
                              backgroundColor: Colors.transparent,
                            ),
                        placeholder: (context, url) => Shimmer.fromColors(
                          child: CircleAvatar(radius: 25.0),
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[400]!,
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(CupertinoIcons.person,size: 30,),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(Get.find<GlobalController>().userName != null) Text(
                            Get.find<GlobalController>().userName.toString(),
                            style: kTextStyle.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          if(Get.find<GlobalController>().userEmail != null)Text(
                            Get.find<GlobalController>().userEmail.toString(),
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: (() => const Home().launch(context)),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    FontAwesomeIcons.house,
                    color: kTitleColor,
                    size: 18.0,
                  ),
                  title: Text(
                    'dashboard'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,),
                    child: const Icon(FeatherIcons.chevronRight,
                        color: kTitleColor, size: 18),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    FontAwesomeIcons.users,
                    color: kTitleColor,
                    size: 18.0,
                  ),
                  onTap: (() => const ShopsPage().launch(context)),
                  title: Text(
                    'shop'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,),
                    child: const Icon(FeatherIcons.chevronRight,
                        color: kTitleColor, size: 18),
                  ),
                ),

                ListTileTheme(
                  iconColor: kTitleColor,
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  horizontalTitleGap: 30,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    leading: const Icon(FontAwesomeIcons.solidFileLines,
                        size: 14.0, color: kTitleColor),
                    title: Text(
                      'parcels'.tr,
                      style: kTextStyle.copyWith(
                          color: kTitleColor, fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(FeatherIcons.chevronDown,
                          color: kTitleColor, size: 18),
                    ),
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: Text(
                            'parcels'.tr,
                            style: kTextStyle.copyWith(color: kGreyTextColor,fontWeight: FontWeight.w600),
                          ),
                        ),
                        onTap: (() =>  ParcelPage(height: 0.85,).launch(context)),
                      ),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: Text(
                            'Parcel Categories'.tr,
                            style: kTextStyle.copyWith(color: kGreyTextColor,fontWeight: FontWeight.w600),
                          ),
                        ),
                        onTap: (() => const ParcelAllStatus().launch(context)),
                      ),
                    ],
                  ),
                ),

                ListTile(
                  onTap: (() => const Frauds().launch(context)),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    FontAwesomeIcons.boxArchive,
                    color: kTitleColor,
                    size: 18.0,
                  ),
                  title: Text(
                    'fraud_check'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,),
                    child: const Icon(FeatherIcons.chevronRight,
                        color: kTitleColor, size: 18),
                  ),
                ),
                ListTile(
                  onTap: (() => const Support().launch(context)),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    FontAwesomeIcons.paperPlane,
                    color: kTitleColor,
                    size: 18.0,
                  ),
                  title: Text(
                    'support'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,),
                    child: const Icon(FeatherIcons.chevronRight,
                        color: kTitleColor, size: 18),
                  ),
                ),
                ListTileTheme(
                    iconColor: kTitleColor,
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    horizontalTitleGap: 30,
                    minLeadingWidth: 0,
                    child: ExpansionTile(
                      leading: const Icon(FontAwesomeIcons.users,
                          size: 14.0, color: kTitleColor),
                      title: Text(
                        'Payments'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(FeatherIcons.chevronDown,
                            color: kTitleColor, size: 18),
                      ),
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left:20.0),
                            child: Text(
                              'payment_account'.tr,
                              style: kTextStyle.copyWith(color: kGreyTextColor,fontWeight: FontWeight.w600),
                            ),
                          ),
                          onTap: (() => const PaymentAcc().launch(context)),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left:20.0),
                            child: Text(
                              'payment_request'.tr,
                              style: kTextStyle.copyWith(color: kGreyTextColor,fontWeight: FontWeight.w600),
                            ),
                          ),
                          onTap: (() => const PaymentReq().launch(context)),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left:20.0),
                            child: Text(
                              'Payments/Invoices'.tr,
                              style: kTextStyle.copyWith(color: kGreyTextColor,fontWeight: FontWeight.w600),
                            ),
                          ),
                          onTap: (() => const InvoiceList().launch(context)),
                        ),
                      ],
                    )),

                ListTileTheme(
                  iconColor: kTitleColor,
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  horizontalTitleGap: 30,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    leading: const Icon(FontAwesomeIcons.solidFileLines,
                        size: 14.0, color: kTitleColor),
                    title: Text(
                      'reports'.tr,
                      style: kTextStyle.copyWith(
                          color: kTitleColor, fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(FeatherIcons.chevronDown,
                          color: kTitleColor, size: 18),
                    ),
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: Text(
                            'account_transaction'.tr,
                            style: kTextStyle.copyWith(color: kGreyTextColor,fontWeight: FontWeight.w600),
                          ),
                        ),
                        onTap: (() => const AccTransaction().launch(context)),
                      ),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: Text(
                            'statements'.tr,
                            style: kTextStyle.copyWith(color: kGreyTextColor,fontWeight: FontWeight.w600),
                          ),
                        ),
                        onTap: (() => const DateToDateStatement().launch(context)),
                      ),
                    ],
                  ),
                ),
                ListTileTheme(
                    iconColor: kTitleColor,
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    horizontalTitleGap: 30,
                    minLeadingWidth: 0,
                    child: ExpansionTile(
                      leading: const Icon(FontAwesomeIcons.gears,
                          size: 14.0, color: kTitleColor),
                      title: Text(
                        'setting'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(FeatherIcons.chevronDown,
                            color: kTitleColor, size: 18),
                      ),
                      children: [
                        ListTile(
                          onTap: (() => const CodChargeList().launch(context)),
                          title: Text(
                            'cod_charges'.tr,
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        ListTile(
                          onTap: (() => const DeliveryChargeList().launch(context)),
                          title: Text(
                            'delivery_charges'.tr,
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),

                      ],
                    )),

                ListTile(
                  onTap: () => {
                    Get.find<GlobalController>().userLogout(),
                    Navigator.of(context).pop()
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.exit_to_app,
                    color: kTitleColor,
                    size: 18.0,
                  ),
                  title: Text(
                    'log_out'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,),
                    child: const Icon(FeatherIcons.chevronRight,
                        color: kTitleColor, size: 18),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: 0,
        backgroundColor: kMainColor,
        elevation: 0.0,
        title: ListTile(
          horizontalTitleGap: 0,
          contentPadding: const EdgeInsets.all(10.0),
          title: Text(
            '${Get.find<GlobalController>()
                .siteName}',
            style: kTextStyle.copyWith(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          trailing:
          Container(
            padding: EdgeInsets.only(left: 8,right: 0),
            decoration: BoxDecoration(
              color: Colors.white, //<-- SEE HERE
            ),
            height: 25.0,
            child: DropdownButton<Language>(
              iconSize: 18,
              elevation: 16,
              value: selectedLang,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                padding: const EdgeInsets.only(left: 4, right: 4),
                color: Colors.transparent,
              ),
              onChanged: (newValue) async {
                setState(()  {
                  selectedLang = newValue!;
                  if (newValue.langName == 'English') {
                    languageController.changeLanguage("en");
                  } else if (newValue.langName == 'Bangla') {
                    languageController.changeLanguage("bn");
                  } else if (newValue.langName == 'हिन्दी') {
                    languageController.changeLanguage("hi");
                  } else if (newValue.langName == 'عربي') {
                    languageController.changeLanguage("ar");
                  } else if (newValue.langName == 'Spanish') {
                    languageController.changeLanguage("es");
                  }
                });

              },
              items: languageController.languageList
                  .map<DropdownMenuItem<Language>>((Language value) {
                return DropdownMenuItem<Language>(
                  value: value,
                  child: Text(
                    value.langName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body:  GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (dashboard) =>
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    dashboard.dashboardLoader
                        ? DashboardShimmer()
                        : Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFf9f9fe),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 200,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                onPageChanged: null,
                                scrollDirection: Axis.horizontal,
                              ),
                              // itemCount: imageList.length,
                              itemCount:  dashboard.offersList.isNotEmpty?dashboard.offersList.length:imageList.length,
                              itemBuilder:
                                  (BuildContext context, int index, int realIndex) {
                                return dashboard.offersList.isNotEmpty?
                                  CachedNetworkImage(
                                        imageUrl:dashboard.offersList[index].image.toString(),
                                        imageBuilder: (context, imageProvider) =>
                                            Container(
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image:imageProvider
                                                  ),
                                              )),
                                                      placeholder: (context, url) => Shimmer.fromColors(
                                          child: CircleAvatar(radius: 50.0),
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[400]!,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(CupertinoIcons.person,size: 50,),
                                      )
                                    :Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        imageList[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 20),
                            ButtonGlobal(
                                buttontext: 'Check Balance ➤'.tr,
                                buttonDecoration: kButtonDecoration.copyWith(color: Colors.deepOrangeAccent.shade200,boxShadow:  [BoxShadow(color: Colors.black.withOpacity(.2),blurRadius: 3,offset: Offset(0,1))]),
                                onPressed: () {
                                  setState(() {
                                    const BalanceDetails().launch(context);
                                  });
                                }),
                            const SizedBox(height: 20),
                            Text(
                              'merchant_dashboard'.tr,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            const SizedBox(height: 10),
                            GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10.0,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                4,
                                    (i) {
                                  return
                                    Card(
                                      color: colorList[i],
                                      elevation: 10,
                                      shadowColor: kMainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 20),
                                            Icon(
                                              iconList[i],
                                              size: 40,
                                              color: kTitleColor,
                                            ),
                                            const SizedBox(height: 10.0),
                                            Text(
                                              reportList[i],
                                              style: kTextStyle.copyWith(
                                                  color: kTitleColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Text(
                                              i == 0? dashboard.dashboardData.tParcel.toString(): i==1?dashboard.dashboardData.tDelivered.toString():i==2?dashboard.dashboardData.tReturn.toString():i==3? "${dashboard.dashboardData.tParcel! - (dashboard.dashboardData.tDelivered! + dashboard.dashboardData.tReturn!)}" :'0',
                                              style: kTextStyle.copyWith(
                                                  color: kTitleColor,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              elevation: 10,
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: kGreyTextColor.withOpacity(0.2),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'total_cash_collection'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tCashCollection.toString()}',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'total_selling_price'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tSellingPrice.toString()}',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'net_profit_amount'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tCashCollection! - dashboard.dashboardData.tSellingPrice!}",
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: kGreyTextColor.withOpacity(0.2),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'total_liquid_fragile_amount'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tLiquidFragile.toString()}",
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'total_packing_amount'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                               "${Get.find<GlobalController>()
                                                   .currency!} ${dashboard.dashboardData.tPackaging.toString()}",
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'total_vat_amount'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tVatAmount.toString()}',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'total_delivery_charge'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tDeliveryCharge.toString()}',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'total_cod_amount'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tCodAmount.toString()}',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: kGreyTextColor.withOpacity(0.2),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'total_delivery_amount'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tDeliveryAmount.toString()}',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'total_current_payable_amount'.tr,
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${Get.find<GlobalController>()
                                                    .currency!} ${dashboard.dashboardData.tCurrentPayable.toString()}',
                                                style: kTextStyle.copyWith(
                                                    color: kTitleColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'all_reports'.tr,
                              style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.handHoldingDollar,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'total_sales_amount'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${Get.find<GlobalController>()
                                            .currency!} ${dashboard.dashboardData.tSale.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.handshakeAngle,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'total_delivery_fees_paid'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${Get.find<GlobalController>()
                                            .currency!} ${dashboard.dashboardData.tDeliveryFee.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.coins,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'net_profit_amount'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        "${Get.find<GlobalController>()
                                            .currency!} ${double.parse(dashboard.dashboardData.tSale.toString()) - double.parse(dashboard.dashboardData.tDeliveryFee.toString())}",
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.creditCard,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'current_balance'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${Get.find<GlobalController>()
                                            .currency!} ${dashboard.dashboardData.merchant!.currentBalance.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.circleDollarToSlot,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'opening_balance'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${Get.find<GlobalController>()
                                            .currency!} ${dashboard.dashboardData.merchant!.openingBalance.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.dna,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'vat'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${Get.find<GlobalController>()
                                            .currency!} ${dashboard.dashboardData.merchant!.vat.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.hourglass,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'payment_processing'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${Get.find<GlobalController>()
                                            .currency!} ${dashboard.dashboardData.tBalanceProc.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.database,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'paid_amount'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${Get.find<GlobalController>()
                                            .currency!} ${dashboard.dashboardData.tBalancePaid.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.houseChimney,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'total_shop'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${dashboard.dashboardData.tShop.toString()}',
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.boxesStacked,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'total_parcel_bank_item'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        dashboard.dashboardData.tParcelBank.toString(),
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.clockRotateLeft,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'total_payment_request'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        dashboard.dashboardData.tRequest.toString(),
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    FontAwesomeIcons.users,
                                    color: kTitleColor,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'total_fraud_customer'.tr,
                                        style: kTextStyle.copyWith(color: kTitleColor),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        dashboard.dashboardData.tFraud.toString(),
                                        style: kTextStyle.copyWith(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
