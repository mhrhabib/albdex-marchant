import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/payment_account_list_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class PaymentAccountController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  List<Accounts> accountList = <Accounts>[];
  List<Accounts> accountData = <Accounts>[];



  @override
  void onInit() {
    getPaymentAccount();
    super.onInit();
  }

  getPaymentAccountList() async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getPaymentAccount();
  }

  getPaymentAccount() {
    server.getRequest(endPoint: APIList.paymentAccountList).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var accountData = PaymentAccountListModel.fromJson(jsonResponse);
        accountList = <Accounts>[];
        accountList.addAll(accountData.data!.accounts!);
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        accountData = <Accounts>[];
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
    print(jsonBody);
    server
        .postRequestWithToken(endPoint: APIList.paymentAccountAdd, body: jsonBody)
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
        getPaymentAccountList();
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
        getPaymentAccountList();
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
