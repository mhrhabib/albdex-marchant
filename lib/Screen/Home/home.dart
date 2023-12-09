import 'package:bottom_bar/bottom_bar.dart';
import '/Screen/Home/dashboard.dart';
import '/Screen/Parcel/parcel_index.dart';
import '/Screen/Profile/profile.dart';
import '/Screen/delivery_charges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Widgets/constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = true;
  int _currentPage = 0;


  static  List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    ParcelPage(height: 0.78),
    DeliveryChargeList(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: _widgetOptions.elementAt(_currentPage),
      bottomNavigationBar: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, -1))
              ]
          ),
          child: BottomBar(
            backgroundColor: Color(0xFFFFFFFF),
            items: [
              /// Home
              BottomBarItem(
                icon: const Icon(FontAwesomeIcons.house, size: 16.0),
                title: Text(
                  "home".tr,
                  style: kTextStyle.copyWith(color: kTitleColor,fontSize: 13,fontWeight: FontWeight.w700),
                ),
                activeColor: kTitleColor,
                inactiveColor: kTitleColor,
              ),

              /// History

              /// Orders
              BottomBarItem(
                backgroundColorOpacity: 0.1,
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  size: 16.0,
                ),
                title: Text(
                  "parcel".tr,
                  style: kTextStyle.copyWith(color: kTitleColor,fontSize: 13,fontWeight: FontWeight.w700),
                ),
                activeColor: kTitleColor,
                inactiveColor: kTitleColor,
              ),

              BottomBarItem(
                icon: const Icon(FontAwesomeIcons.clipboardList, size: 16.0),
                title: Text(
                  "delivery_charges".tr,
                  style: kTextStyle.copyWith(color: kTitleColor,fontSize: 13,fontWeight: FontWeight.w700),
                ),
                activeColor: kTitleColor,
                inactiveColor: kTitleColor,
              ),


              /// Profile
              BottomBarItem(
                icon: Icon(FontAwesomeIcons.user, size: 16.0),
                title: Text("profile".tr,style: kTextStyle.copyWith(color: kTitleColor,fontSize: 13,fontWeight: FontWeight.w700),
                ),
                activeColor: kTitleColor,
                inactiveColor: kTitleColor,
              ),
            ],
            onTap: (int index) {
              setState(() => _currentPage = index);
            },
            selectedIndex: _currentPage,
          )
      ),
    );
  }
}