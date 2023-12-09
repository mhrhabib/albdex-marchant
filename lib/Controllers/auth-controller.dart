import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/login_models.dart';
import '../Models/refresh_token_model.dart';
import '../Models/register_model.dart';
import '../Screen/Authentication/sign_in.dart';
import '../Screen/Authentication/verify_otp.dart';
import '../Screen/Home/home.dart';

import 'package:get/get.dart';

import '../services/api-list.dart';
import '../services/server.dart';
import '../services/user-service.dart';
import '../services/validators.dart';
import 'global-controller.dart';

class AuthController extends GetxController {
  UserService userService = UserService();
  final Validators _validators = Validators();
  Server server = Server();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  bool obscureText = true;
  bool loader = false;

  changeVisibility() {
    obscureText = !obscureText;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
  }

  loginOnTap({BuildContext? context, String? email, String? pass}) async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    var passValidator = _validators.validatePassword(value: pass);
    if (passValidator == null) {
      Map body = {'email': email, 'password': pass};
      String jsonBody = json.encode(body);
      server
          .postRequest(endPoint: APIList.login, body: jsonBody)
          .then((response) {
        print(">>>>>>>>>>>>>>>>>${response.statusCode}");
        print(">>>>>>>>>>>>>>>>>${response.body}");
        if (response != null && response.statusCode == 200) {
          updateFcmSubscribe(email);
          final jsonResponse = json.decode(response.body);
          var loginData = LoginModels.fromJson(jsonResponse);
          var bearerToken = 'Bearer ' + "${loginData.data?.token}";
          userService.saveBoolean(key: 'is-user', value: true);
          userService.saveString(key: 'token', value: loginData.data?.token);
          userService.saveString(
              key: 'user-id', value: loginData.data!.user?.id.toString());
          userService.saveString(
              key: 'email', value: loginData.data!.user!.email.toString());
          userService.saveString(
              key: 'image', value: loginData.data!.user!.image.toString());
          userService.saveString(
              key: 'name', value: loginData.data!.user!.name.toString());
          userService.saveString(
              key: 'phone', value: loginData.data!.user!.phone.toString());

          Server.initClass(token: bearerToken);
          Get.put(GlobalController()).initController();
          emailController.clear();
          passwordController.clear();
          loader = false;
          Future.delayed(const Duration(milliseconds: 10), () {
            update();
          });
          Get.off(() => const Home());
          Get.rawSnackbar(
              message: "${loginData.message}",
              backgroundColor: Colors.green,
              snackPosition: SnackPosition.TOP);
        } else {
          loader = false;
          Future.delayed(const Duration(milliseconds: 10), () {
            update();
          });
          final jsonResponse = json.decode(response.body);
          Get.rawSnackbar(
              message: "${jsonResponse['message']}",
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP);
        }
      });
    } else {
      loader = false;
      Future.delayed(Duration(milliseconds: 10), () {
        update();
      });
      Get.rawSnackbar(message: 'Please enter email address and password');
    }
  }

  refreshToken() async {
    server.getRequest(endPoint: APIList.refreshToken).then((response) {
      try {
        if (response != null && response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          var refreshData = RefreshTokenModel.fromJson(jsonResponse);
          print(refreshData);
          var newToken = 'Bearer ' + "${refreshData.data!.token}";
          userService.saveBoolean(key: 'is-user', value: true);
          userService.saveString(key: 'token', value: refreshData.data!.token);
          Server.initClass(token: newToken);
          Get.put(GlobalController()).initController();
          Get.off(() => const Home());
          return true;
        } else {
          return false;
        }
      } catch (e) {
        Get.off(() => const SignIn());
      }
    });
  }

  signupOnTap(hubID) async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'business_name': businessNameController.text,
      'full_name': firstNameController.text + ' ' + lastNameController.text,
      'address': addressController.text,
      'email': emailController.text,
      'mobile': phoneController.text,
      'password': passwordController.text,
      'hub_id': hubID.toString(),
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .postRequest(endPoint: APIList.register, body: jsonBody)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var regData = RegisterModel.fromJson(jsonResponse);
        if (regData.success!) {
          Get.off(OtpVerify(
            mobile: regData.data!.mobile.toString(),
          ));
          Get.rawSnackbar(
              message: "${regData.message}",
              backgroundColor: Colors.green,
              snackPosition: SnackPosition.TOP);
          businessNameController.clear();
          firstNameController.clear();
          lastNameController.clear();
          phoneController.clear();
          passwordController.clear();
          emailController.clear();
        }
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else if (response != null && response.statusCode == 422) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        if (jsonResponse['data']['message']['mobile'] != null) {
          Get.rawSnackbar(
              message: jsonResponse['data']['message']['mobile'].toString(),
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP);
        }
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      }
    });
  }

  otpVerification(mobile) async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    Map body = {
      'otp':
          '${otp1.text.toString() + otp2.text.toString() + otp3.text.toString() + otp4.text.toString() + otp5.text.toString()}',
      'mobile': mobile
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .postRequest(endPoint: APIList.verifyOtp, body: jsonBody)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var loginData = LoginModels.fromJson(jsonResponse);
        var bearerToken = 'Bearer ' + "${loginData.data?.token}";
        userService.saveBoolean(key: 'is-user', value: true);
        userService.saveString(key: 'token', value: loginData.data?.token);
        userService.saveString(
            key: 'user-id', value: loginData.data!.user?.id.toString());
        userService.saveString(
            key: 'email', value: loginData.data!.user!.email.toString());
        userService.saveString(
            key: 'image', value: loginData.data!.user!.image.toString());
        userService.saveString(
            key: 'name', value: loginData.data!.user!.name.toString());
        userService.saveString(
            key: 'phone', value: loginData.data!.user!.phone.toString());

        Server.initClass(token: bearerToken);
        Get.put(GlobalController()).initController();
        otp1.clear();
        otp2.clear();
        otp3.clear();
        otp4.clear();
        otp5.clear();
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.off(() => const Home());
        Get.rawSnackbar(
            message: "${loginData.message}",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        final jsonResponse = json.decode(response.body);
        Get.rawSnackbar(
            message: "${jsonResponse['message']}",
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP);
      }
    });
  }

  updateFcmSubscribe(email) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var deviceToken = storage.getString('deviceToken');
    Map body = {
      "device_token": deviceToken,
      "topic": email,
    };
    String jsonBody = json.encode(body);
    server
        .postRequest(endPoint: APIList.fcmSubscribe, body: jsonBody)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print('responseBody===========>');
        print(jsonResponse);
      }
    });
  }
}
