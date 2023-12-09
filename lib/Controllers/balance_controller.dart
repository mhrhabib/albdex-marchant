import 'dart:convert';
import '/Models/balance_detials_model.dart';
import 'package:flutter/material.dart';

import '../Models/payment_account_list_model.dart';
import '../Models/support_list.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class BalanceController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  BalanceDetailsModel balanceDetails = BalanceDetailsModel();



  @override
  void onInit() {
    getBalanceDetails();
    super.onInit();
  }

  getBalanceDetails() {
    server.getRequest(endPoint: APIList.balanceDetails).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        balanceDetails = BalanceDetailsModel.fromJson(jsonResponse);
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
}
