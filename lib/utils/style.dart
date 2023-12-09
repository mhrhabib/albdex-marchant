import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screen/Widgets/constant.dart';

class Dimensions {
  static double fontSizeExtraSmallSamll = 8;
  static double fontSizeExtraSmall = 10;
  static double fontSizeSmall = 12;
  static double fontSizeDefault = 14;
  static double fontSizeReasonHeading = 14;
  static double fontSizeReasonText = 12;
  static double fontSizeLarge = 16;
  static double fontSizeExtraLarge = 18;
  static double fontSizeExtraLarge22 = 22;
  static double fontSizeOverLarge = 26;
}

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context);
  double get mainHeight => MediaQuery.of(context).size.height;
  double get mainWidth => MediaQuery.of(context).size.width;
}

final fontSizeSmall = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeExtraSmall.sp,
);
final fontSizeSmallGray = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  color: grayColor,
  fontSize: Dimensions.fontSizeExtraSmall.sp,
);

final fontSizeReasonText = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeReasonText.sp,
);

final fontSizeAuth = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeReasonHeading.sp,
);

final fontSmall = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeExtraSmallSamll.sp,
);
final fontSmallwithColor = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  color: kMainColor,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontSmallBold = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: 11,
);
final fontRegularPro = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault.sp,
);
final fontRegular = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontRegularWithColor = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  color: kMainColor,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontRegularBold = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: 14.sp,
);
final fontRegularBoldWhite = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: 14.sp,
);
final fontRegularBoldwithWhiteColor = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontRegularBoldGreen = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  color: green,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontRegularBoldwithColor = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeSmall.sp,
  color: kMainColor,
);

final fontMedium = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeLarge.sp,
);
final fontMediumPro = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeDefault.sp,
);

final fontMediumProWhite = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w600,
  color: Colors.white,
  fontSize: Dimensions.fontSizeDefault.sp,
);
final fontSemiBold = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);

final fontBold = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeExtraLarge.sp,
);
final fontBoldWithColor = TextStyle(
    fontFamily: 'Rubik',
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.fontSizeExtraLarge.sp,
    color: kMainColor);

final fontBlack = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeOverLarge.sp,
);
final fontSizeExtraLarge22 = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeExtraLarge22.sp,
);

final fontProfile = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: fontColor);
