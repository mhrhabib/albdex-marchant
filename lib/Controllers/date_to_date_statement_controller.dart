import 'dart:convert';
import '/Models/balance_detials_model.dart';
import '/Models/date_to_date_statement_model.dart';
import 'package:flutter/material.dart';

import '../Models/payment_account_list_model.dart';
import '../Models/support_list.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class DateToDateStatementController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  DateToDateStatementModel statement = DateToDateStatementModel();
  DateTime startDate = DateTime.now().subtract(Duration(days: 7));
  DateTime endDate = DateTime.now();



  @override
  void onInit() {
    getStatement();
    super.onInit();
  }

  getStatement() {

    Map body = {
      'date': "${startDate.month}/${startDate.day}/${startDate.year} To ${endDate.month}/${endDate.day}/${endDate.year}",
    };
    String jsonBody = json.encode(body);
    print(jsonBody);

    server.postRequestWithToken(endPoint: APIList.statementReport,body: jsonBody).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        statement = DateToDateStatementModel.fromJson(jsonResponse);
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
