import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kMainColor = Color(0XFFE14915);
const kBgColor = Color(0xFFfafafb);
const Color itembg = Color(0xffEFF0F6);
const Color deleveryColor = Color(0xffBDEFFF);
const kSecondaryColor = Color(0xFF007AF);
const kGreyTextColor = Color(0xFF818181);
const kBorderColorTextField = Color(0xFFE8E7E5);
const kDarkWhite = Color(0xFFEFF0F5);
const kTitleColor = Color(0xFF030303);
const Color fontColor = Color(0xff1F1F39);
const Color green = Color(0xff1AB759);
const Color yellow = Color(0xffFFDB1F);
const Color grayColor = Color(0xff6E7191);
const Color dividerColor = Color(0xffEFF0F6);
const Color borderColor = Color(0xffE3EBFF);
const Color redColor = Color(0xffDD2702);

const kDangerColor = Color(0xFFff407b);
final kTextStyle = GoogleFonts.manrope(
  color: Colors.white,
);
const kButtonDecoration = BoxDecoration(
  color: kMainColor,
  borderRadius: BorderRadius.all(
    Radius.circular(40.0),
  ),
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: kBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: kBorderColorTextField),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

List<String> businessCategory = ['Fashion Store', 'Electronics Store', 'Computer Store', 'Vegetable Store', 'Sweet Store', 'Meat Store'];
List<String> language = ['English', 'Bengali', 'Hindi', 'Urdu', 'French', 'Spanish'];

List<String> productCategory = ['Fashion', 'Electronics', 'Computer', 'Gadgets', 'Watches', 'Cloths'];

List<String> userRole = [
  'Super Admin',
  'Admin',
  'User',
];

List<String> paymentType = [
  'Cheque',
  'Deposit',
  'Cash',
  'Transfer',
  'Sales',
];
List<String> posStats = [
  'Daily',
  'Monthly',
  'Yearly',
];
List<String> saleStats = [
  'Weekly',
  'Monthly',
  'Yearly',
];
