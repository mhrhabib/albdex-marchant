import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/payment_request_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class PaymentRequestController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  List<Payments> requestList = <Payments>[];



  @override
  void onInit() {
    getPaymentRequest();
    super.onInit();
  }

  getPaymentRequestList() async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getPaymentRequest();
  }

  getPaymentRequest() {
    server.getRequest(endPoint: APIList.paymentRequestList).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var accountData = PaymentRequestModel.fromJson(jsonResponse);
        requestList = <Payments>[];
        requestList.addAll(accountData.data!.payments!);
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


  paymentAccountPost(String method,bankName,holderName,accountNumber,branchName,routingNumber) {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map body = {
      'bank_name': bankName,
      'holder_name': holderName,
      'account_no': accountNumber,
      'branch_name': branchName,
      'routing_no': routingNumber,
      'status': "1",
      'payment_method': method.toLowerCase(),
    };
    String jsonBody = json.encode(body);
    server
        .postRequestWithToken(endPoint: APIList.paymentAccountAdd, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        getPaymentRequestList();
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


  paymentAccountDelete(id) {
    server
        .deleteRequest(endPoint: APIList.supportRemoveUrl!+id.toString())
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        getPaymentRequestList();
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

  paymentRequestPost(double amount, int accountId,String description) {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    Map body = {
      'amount': amount,
      'merchant_account': accountId,
      'description': description,
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .postRequestWithToken(endPoint: APIList.paymentRequestAdd, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
        Get.showSnackbar(GetSnackBar(message:'Payment Request Succeeded',duration: Duration(seconds: 2),));
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
        Get.showSnackbar(GetSnackBar(message:'Payment Request Failed',duration: Duration(seconds: 2),));
      }
    });
  }
}