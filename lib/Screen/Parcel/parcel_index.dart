import '/Models/parcels_model.dart';
import '/Screen/Parcel/create_parcel.dart';
import '/Screen/Parcel/parcel_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Controllers/global-controller.dart';
import '../../Controllers/parcel_controller.dart';
import '../Widgets/constant.dart';
import '../Widgets/shimmer/parcel_shimmer.dart';

class ParcelPage extends StatefulWidget {
  final double height;
  ParcelPage({Key? key, required this.height}) : super(key: key);

  @override
  State<ParcelPage> createState() => _ParcelPageState();
}

class _ParcelPageState extends State<ParcelPage> {
  DateTime selectedDate = DateTime.now();
  DateTime pickupDate = DateTime.now();
  ParcelController parcelController = ParcelController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickupDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: pickupDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != pickupDate) {
      setState(() {
        pickupDate = picked;
      });
    }
  }

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

  List<String> status = [
    'pending'.tr,
    'pickup_assign'.tr,
    'pickup_assign_cancel'.tr,
    'pickup_re_schedule_cancel'.tr,
    'pickup_re_schedule'.tr,
  ];
  String selectStatus = 'pending'.tr;

  DropdownButton<String> setStatus() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in status) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectStatus,
      onChanged: (value) {
        setState(() {
          selectStatus = value!;
        });
      },
    );
  }

  void showPopUp(Parcels parcel) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 10,
                        color: kSecondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Invoice: #1232',
                            style: kTextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        color: kSecondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${parcel.statusName}',
                            style: kTextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'merchant'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: kGreyTextColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'shop_name'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.merchantName}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'phone'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.merchantMobile}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'pickup_address'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.merchantAddress}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    'parcel_info'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: kGreyTextColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'tracking_id'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.trackingId}',
                        style: kTextStyle.copyWith(color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'delivery_type'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.deliveryType}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'pickup_time'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.pickupDate}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'delivery_time'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.deliveryDate}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'total_charge_amount'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.totalDeliveryAmount}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'vat_amount'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.vatAmount}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'current_payable'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.currentPayable}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        'cash_collection'.tr + ':',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${parcel.cashCollection}',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Center(
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            color: kMainColor, shape: BoxShape.circle),
                        child: const Icon(
                          FontAwesomeIcons.x,
                          color: kTitleColor,
                        )).onTap(
                      () => finish(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showFilterPopUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 550,
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        labelText: 'date'.tr,
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
                          child: setDate(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        labelText: 'pickup_date'.tr,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kGreyTextColor.withOpacity(0.15))),
                      ),
                      child: ListTile(
                        onTap: (() => _selectDate(context)),
                        title: Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        trailing: const Icon(
                          FeatherIcons.calendar,
                          color: kTitleColor,
                        ),
                        contentPadding: const EdgeInsets.only(right: 10),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        labelText: 'delivery_date'.tr,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kGreyTextColor.withOpacity(0.15))),
                      ),
                      child: ListTile(
                        onTap: (() => _pickupDate(context)),
                        title: Text(
                          '${pickupDate.day}/${pickupDate.month}/${pickupDate.year}',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        trailing: const Icon(
                          FeatherIcons.calendar,
                          color: kTitleColor,
                        ),
                        contentPadding: const EdgeInsets.only(right: 10),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10.0),
                        labelText: 'status'.tr,
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
                          child: setStatus(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      showCursor: true,
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.NAME,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'customer_name'.tr,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'customer_name'.tr,
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      showCursor: true,
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.NAME,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'customer_phone'.tr,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'customer_phone'.tr,
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 10,
                          color: kMainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Text(
                              'submit'.tr,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ).onTap(
                          () => ParcelPage(
                            height: widget.height,
                          ).launch(context),
                        ),
                        const SizedBox(width: 5.0),
                        Card(
                          elevation: 10,
                          color: kMainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: kSecondaryColor,
                            ),
                            child: Text(
                              'cancel'.tr,
                              style: kTextStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ).onTap(
                          () =>
                              ParcelPage(height: widget.height).launch(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  double heightValue = 0.78;
  @override
  Widget build(BuildContext context) {
    setState(() {
      heightValue = widget.height;
    });

    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'parcel_list'.tr,
          style: kTextStyle.copyWith(color: kBgColor),
        ),
        actions: [
          Card(
            elevation: 0,
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
                    FontAwesomeIcons.plus,
                    color: kBgColor,
                    size: 16.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    'add'.tr,
                    style: kTextStyle.copyWith(
                        color: kBgColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ).onTap(
              () => Get.to(() => CreateParcel()),
            ),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body: GetBuilder<ParcelController>(
          init: ParcelController(),
          builder: (parcel) => Container(
              padding: const EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.height * heightValue,
                        child: SingleChildScrollView(
                            child: parcel.loader
                                ? ParcelShimmer()
                                : Padding(
                                    padding: EdgeInsets.all(0.r),
                                    child: SingleChildScrollView(
                                      child: ListView.builder(
                                          // primary: false,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: parcel.parcelList.length,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return Padding(
                                              padding: EdgeInsets.all(5.r),
                                              child: InkWell(
                                                onTap: () => ParcelDetails(
                                                        parcel: parcel
                                                            .parcelList[index],
                                                        id: parcel
                                                            .parcelList[index]
                                                            .id)
                                                    .launch(context),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.r),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: itembg)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.r),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          SizedBox(
                                                            width: 300.w,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: 6.h,
                                                                      bottom:
                                                                          10.h),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "trackingId"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.sp,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                      Text(
                                                                        "#${parcel.parcelList[index].trackingId.toString()}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      const Spacer(),
                                                                      Container(
                                                                        padding:
                                                                            EdgeInsets.all(4.r),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(10.r)),
                                                                          color:
                                                                              deleveryColor,
                                                                        ),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              70,
                                                                          child:
                                                                              Text(
                                                                            parcel.parcelList[index].statusName.toString(),
                                                                            maxLines:
                                                                                2,
                                                                            style:
                                                                                TextStyle(fontSize: 8.sp),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  parcel
                                                                      .parcelList[
                                                                          index]
                                                                      .customerName
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                const SizedBox(
                                                                  height: 2,
                                                                ),
                                                                Text(
                                                                  parcel
                                                                      .parcelList[
                                                                          index]
                                                                      .customerPhone
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                SizedBox(
                                                                  height: 8.h,
                                                                ),
                                                                Text(
                                                                  parcel
                                                                      .parcelList[
                                                                          index]
                                                                      .customerAddress
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                SizedBox(
                                                                  height: 8.h,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "total"
                                                                          .tr,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    Text(
                                                                      " ${Get.find<GlobalController>().currency!}${parcel.parcelList[index].cashCollection.toString()}",
                                                                    ),
                                                                    const Spacer(),
                                                                    Text(
                                                                      "SEE_PARCEL_DETAILS"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          color:
                                                                              kMainColor),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          2.w,
                                                                    ),
                                                                    const Icon(
                                                                      IconData(
                                                                          0xe09c,
                                                                          fontFamily:
                                                                              'MaterialIcons',
                                                                          matchTextDirection:
                                                                              true),
                                                                      color:
                                                                          kMainColor,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ))))
                  ],
                ),
              ))),
    );
  }
}
