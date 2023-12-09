import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/fraud_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class FraudController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  List<Frauds> fraudList = <Frauds>[];
  TextEditingController detailsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController trackingIDController = TextEditingController();

  TextEditingController detailsUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController phoneUpdateController = TextEditingController();
  TextEditingController trackingIDUpdateController = TextEditingController();


  @override
  void onInit() {
    getFraud();
    super.onInit();
  }

  getFraudList() async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getFraud();
  }

  getFraud() {
    server.getRequest(endPoint: APIList.fraudList).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var fraudData = FraudModel.fromJson(jsonResponse);
        fraudList = <Frauds>[];
        fraudList.addAll(fraudData.data!.frauds!);
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  fraudPost() {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map body = {
      'name': nameController.text,
      'details': detailsController.text,
      'phone': phoneController.text,
      'tracking_id': trackingIDController.text,
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .postRequestWithToken(endPoint: APIList.fraudPost, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        detailsController.clear();
        nameController.clear();
        phoneController.clear();
        trackingIDController.clear();
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        getFraudList();
        Get.back();
        Get.rawSnackbar(
            message: "${jsonResponse['message']}",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['data']['message']['name'] != null) {
          Get.rawSnackbar(message: jsonResponse['data']['message']['name'].toString(),backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP);
        } else if (jsonResponse['data']['message']['phone'] != null) {
          Get.rawSnackbar(message: jsonResponse['data']['message']['phone'].toString(),backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP);
        } else if (jsonResponse['data']['message']['details'] != null) {
          Get.rawSnackbar(message: jsonResponse['data']['message']['details'].toString(),backgroundColor: Colors.red,
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
        Get.rawSnackbar(message: 'Please enter valid input',backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP);
      }
    });
  }

  fraudUpdate(id) {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map body = {
      'name': nameUpdateController.text,
      'details': detailsUpdateController.text,
      'phone': phoneUpdateController.text,
      'tracking_id': trackingIDUpdateController.text,
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .putRequest(endPoint: APIList.fraudUpdate!+id, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        detailsUpdateController.clear();
        nameUpdateController.clear();
        phoneUpdateController.clear();
        trackingIDUpdateController.clear();

        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        getFraudList();
        Get.back();
        Get.rawSnackbar(
            message: "${jsonResponse['message']}",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['data']['message']['name'] != null) {
          Get.rawSnackbar(message: jsonResponse['data']['message']['name'].toString());
        } else if (jsonResponse['data']['message']['phone'] != null) {
          Get.rawSnackbar(message: jsonResponse['data']['message']['phone'].toString());
        } else if (jsonResponse['data']['message']['details'] != null) {
          Get.rawSnackbar(message: jsonResponse['data']['message']['details'].toString());
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

  fraudDelete(id) {
    server
        .deleteRequest(endPoint: APIList.fraudDelete!+id)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        getFraudList();
        Get.back();
        Get.rawSnackbar(
            message: "${jsonResponse['message']}",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      } else {
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      }
    });
  }

}
