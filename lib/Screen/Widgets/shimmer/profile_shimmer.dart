import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../utils/style.dart';
import '../../Profile/change_language_view.dart';
import '../../Profile/change_password_view.dart';
import '../../Profile/edit_profile_view.dart';
import '../constant.dart';
import '../profile_card.dart';
import '/utils/image.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileShimmerState();
  }
}

class _ProfileShimmerState extends State<ProfileShimmer> {
  var mainHeight, mainWidth;
  String? phone, name, address;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return Padding(
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
                  Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.grey[300]!,
                      child:
                    Stack(
                      children: [
                        SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: Center(
                              child:
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(300.0),
                                child: Image.asset(
                                  Images.imageAvatar,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                        ),
                        Positioned(
                          top: 55,
                          right: 30,
                          child: InkWell(
                            child: SizedBox(
                              width: 40.w,
                              height: 40.h,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: SizedBox(
                                  width: 35.w,
                                  height: 35.h,
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
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                  Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.grey[300]!,
                      child:
                    const Text(
                      'example name',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: fontColor,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                    SizedBox(
                      height: 5.h,
                    ),
                  Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.grey[300]!,
                      child:
                    const Text(
                      'example@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 14,
                        color: grayColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    SizedBox(
                      height: 2.h,
                    ),
                  Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.grey[300]!,
                      child:
                    const Text(
                      '0000000000',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 14,
                        color: grayColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ]),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 60,),
                    Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.grey[300]!,
                      child:
                    ProfileCard(
                      page: false,
                      topic: 'blance'.tr,
                      amount: '\$ 00.00',
                      imgUrl: Images.logo,
                      cardColor: kSecondaryColor,
                    )),
                    const SizedBox(
                      width: 16,
                    ),
                    Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.grey[300]!,
                      child:
                    ProfileCard(
                      page: true,
                      topic: 'vat'.tr,
                      amount: '\$ 00.00',
                      imgUrl: Images.logo,
                      cardColor: kMainColor,
                    )),
                  ],
                ),
                SizedBox(height: 30,),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:
                profileItem(EditProfileView(), Images.iconEditProfile,
                    "edit_profile".tr)),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:
                profileItem(ChangePasswordView(), Images.iconChangePass,
                    "change_password".tr)),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:
                profileItem(ChangeLanguageView(), Images.iconChangeLang,
                    "change_language".tr)),
                SizedBox(height: 14,),
                InkWell(
                  child:                  Shimmer.fromColors(
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    child:
                  Column(
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
                  )),
                ),
                SizedBox(height: 90,),
              ],
            ),
          ),
        )

    );
  }
  InkWell profileItem(route, icon, textValue) {
    return InkWell(
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
