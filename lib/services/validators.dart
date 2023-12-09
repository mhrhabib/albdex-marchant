import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class Validators {
  String? validateEmail({String? value}) {
    if (value!.length == 0)
      return "please_enter_your_email".tr;
    else if (validateMobile(value) != null)
      return "please_enter_valid_mobile_number".tr;
    else if (!EmailValidator.validate(value))
      return "please_enter_valid_email";
    else
      return null;
  }

  String? validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length != 10) {
      return 'please_enter_mobile_number'.tr;
    }
    else if (!regExp.hasMatch(value)) {
      return 'please_enter_valid_mobile_number';
    }
    return null;
  }

  String? validatePassword({String? value}) {
    if (value!.isEmpty) {
      return 'password_is_required'.tr;
    } else if (value.length < 6) {
      return 'password_must_be_at_least_8_characters'.tr;
    }
    return null;
  }

  String? validateName({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_your_name'.tr;
    }
    return null;
  }
  String? validateUsername({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_your_username'.tr;
    }
    return null;
  }
  String? validateVehicleID({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_your_vehicleid'.tr;
    }
    return null;
  }
  String? phoneVehicleID({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_your_phone'.tr;
    }
    return null;
  }

  String? validateAccidentName({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_accident_name'.tr;
    }
    return null;
  }

  String? validateAccidentDescription({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_some_notes'.tr;
    }
    return null;
  }
}
