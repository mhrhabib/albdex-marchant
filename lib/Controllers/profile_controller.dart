import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/profile_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordCurrentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  String? userID;

  bool profileLoader = true;
  bool commonLoader = false;
  bool loader = false;
  bool passwordLoader = false;
  late ProfileUserData profileUser;
  late MerchantProfile profileMerchant;
  late ProfileHub profileHub;
  late String name='',email='',address='',mobile='',image='',businessName='';

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  getUserProfile() {
    server.getRequest(endPoint: APIList.profile).then((response) {
      if (response != null && response.statusCode == 200) {
        profileLoader = false;
        final jsonResponse = json.decode(response.body);
        var profileData = ProfileModel.fromJson(jsonResponse);
        profileUser = profileData.data!.user!;
        name = profileData.data!.user!.name!;
        image = profileData.data!.user!.image!;
        mobile = profileData.data!.user!.phone!;
        email = profileData.data!.user!.email.toString();
        address = profileData.data!.user!.address.toString();
        businessName = profileData.data!.user!.merchant!.businessName!;
        profileHub = profileData.data!.user!.hub!;
        profileMerchant = profileData.data!.user!.merchant!;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        profileLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  updateUserProfile(filepath,nidpath,tradepath, type) async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map<String, String> body = {
      'name': nameController.text,
      'address': addressController.text,
      'business_name': businessNameController.text,
      'email': emailController.text,
      'mobile': phoneController.text,
    };
  print(filepath);
    server
        .multipartRequest(
            endPoint: APIList.profileUpdate,
            body: body,
            filepath: filepath,
            nidPath: nidpath,
            tradeLicensepath: tradepath,
            type: type)
        .then((response) {
      print(response);
      if (response != null && response.statusCode == 200) {
        emailController.clear();
        nameController.clear();
        businessNameController.clear();
        addressController.clear();
        phoneController.clear();
        loader = false;
        getUserProfile();
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.back();
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      }
    });
  }

  updateUserPassword({BuildContext? context}) async {
    passwordLoader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map body = {
      'password_current': passwordCurrentController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfirmController.text,
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .putRequest(endPoint: APIList.passwordUpdate, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      if (response != null && response.statusCode == 200) {
        Get.back();
        Get.rawSnackbar(message: 'Successfully Updated Password');
        passwordCurrentController.clear();
        passwordController.clear();
        passwordConfirmController.clear();
        passwordLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['message']['password_current'] != null) {
          Get.rawSnackbar(
              message: jsonResponse['message']['password_current'].toString());
        } else if (jsonResponse['message']['password'] != null) {
          Get.rawSnackbar(
              message: jsonResponse['message']['password'].toString());
        } else if (jsonResponse['message']['password_confirmation'] != null) {
          Get.rawSnackbar(
              message:
                  jsonResponse['message']['password_confirmation'].toString());
        }
        passwordLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        passwordLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      }
    });
  }
}
