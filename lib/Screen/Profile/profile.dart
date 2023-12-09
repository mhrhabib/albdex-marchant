
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../Controllers/global-controller.dart';
import '../../Controllers/profile_controller.dart';
import '../../utils/image.dart';
import '../../utils/style.dart';
import '../Payment/balance_details.dart';
import '../Widgets/button_global.dart';
import '../Widgets/constant.dart';
import 'package:get/get.dart';

import '../Widgets/profile_card.dart';
import '../Widgets/shimmer/profile_shimmer.dart';
import 'change_language_view.dart';
import 'change_password_view.dart';
import 'edit_profile_view.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profile) =>
            Scaffold(
          backgroundColor: kMainColor,
          appBar: AppBar(
            title: Text(
              'profile'.tr,
              style: kTextStyle.copyWith(color: kBgColor),
            ),
            backgroundColor: kMainColor,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: kBgColor),
          ),
          body: Container(
            clipBehavior: Clip.antiAlias,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: Colors.white,
            ),
            child:
            SingleChildScrollView(
              child: Container(child:
              Column(
                children: [
                  const SizedBox(height: 20.0),
                  Column(
                    children: [
                      profile.profileLoader
                          ? ProfileShimmer()
                          :
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        child:
                        SingleChildScrollView(
                          child: SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 100.w,
                                          height: 100.h,
                                          child: Center(
                                            child:
                                            CachedNetworkImage(
                                              imageUrl:profile.profileUser.image.toString(),
                                              imageBuilder: (context, imageProvider) =>
                                                  CircleAvatar(
                                                    radius: 50.0,
                                                    backgroundColor: Colors.transparent,
                                                    backgroundImage:imageProvider,
                                                  ),

                                              placeholder: (context, url) => Shimmer.fromColors(
                                                child: CircleAvatar(radius: 50.0),
                                                baseColor: Colors.grey[300]!,
                                                highlightColor: Colors.grey[400]!,
                                              ),
                                              errorWidget: (context, url, error) =>
                                                  Icon(CupertinoIcons.person,size: 50,),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 75,
                                          right: 20,
                                          child: InkWell(
                                            onTap: (() => Get.to( EditProfileView())),
                                            child: SizedBox(
                                              width: 30.w,
                                              height: 30.h,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: SizedBox(
                                                  width: 30.w,
                                                  height: 30.h,
                                                  child: CircleAvatar(
                                                    backgroundColor: darkGray,
                                                    child: Image.asset(
                                                      Images.iconEdit,
                                                      fit: BoxFit.cover,
                                                      height: 22.h,
                                                      width: 22.w,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                     Text(
                                      profile.profileUser.name.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontSize: 16,
                                        color: fontColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                     Text(
                                      profile.profileUser.email.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontSize: 14,
                                        color: grayColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                     Text(
                                      profile.profileUser.phone.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontSize: 14,
                                        color: grayColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 60,),
                                    ProfileCard(
                                      page: false,
                                      topic: 'opening_balance'.tr,
                                      amount: ' ${Get.find<GlobalController>()
                                          .currency!}${profile.profileMerchant.openingBalance.toString()}',
                                      imgUrl: Images.logo,
                                      cardColor: kSecondaryColor,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    ProfileCard(
                                      page: true,
                                      topic: 'vat'.tr+'%',
                                      amount: ' ${Get.find<GlobalController>()
                                          .currency!}${profile.profileMerchant.vat.toString()}',
                                      imgUrl: Images.logo,
                                      cardColor: kMainColor,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),
                                ButtonGlobal(
                                    buttontext: 'Check Balance ➤'.tr,
                                    buttonDecoration: kButtonDecoration.copyWith(color: Colors.deepOrangeAccent.shade200,boxShadow:  [BoxShadow(color: Colors.black.withOpacity(.2),blurRadius: 3,offset: Offset(0,1))]),
                                    onPressed: () {
                                      setState(() {
                                        const BalanceDetails().launch(context);
                                      });
                                    }),
                                SizedBox(height: 30,),
                                profileItem(EditProfileView(), Images.iconEditProfile,
                                    "edit_profile".tr),
                                profileItem(ChangePasswordView(), Images.iconChangePass,
                                    "change_password".tr),
                                profileItem(ChangeLanguageView(), Images.iconChangeLang,
                                    "change_language".tr),
                                SizedBox(height: 14,),
                                InkWell(
                                  onTap: () {
                                    Get.find<GlobalController>().userLogout();
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Images.iconLogout,
                                            height: 16.h,
                                            width: 16.w,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 16.h,
                                          ),
                                          Text(
                                            "log_out".tr,
                                            style: fontProfile,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 90,),
                              ],
                            ),
                          ),
                        )

                      ),
                    ],
                  ),
                ],
              ),
              ),
            ),
          )
        ),
    );
  }

  InkWell profileItem(route, icon, textValue) {
    return InkWell(
      onTap: () => Get.to(route),
      child:
      Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 18.h,
                width: 18.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 16.h,
              ),
              Text(
                "$textValue",
                style: fontProfile,
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          const Divider(
            thickness: 1,
            endIndent: 10,
            color: dividerColor,
          ),
        ],
      ),
    );
  }

}