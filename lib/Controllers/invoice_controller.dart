import 'dart:convert';
import '/Models/invoice_detials_model.dart';
import '/Models/payment_request_model.dart';
import 'package:flutter/material.dart';

import '../Models/payment_account_list_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  int currentPage = 1;
  int lastPage = 2;
  List<InvoiceDetailsModel> invoiceDetailsList = <InvoiceDetailsModel>[];



  @override
  void onInit() {
    getInvoiceList();
    super.onInit();
  }

  getNextInvoiceList() async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getInvoiceList(page: currentPage+1);
  }

  getInvoiceList({int page = 1}) {
    server.getRequest(endPoint: APIList.invoiceList!+"?page=${page}").then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        for(int i=0; i< jsonResponse["data"].length; i++){
          invoiceDetailsList.add(InvoiceDetailsModel.fromJson(jsonResponse['data'][i]));
        }

        currentPage = jsonResponse["meta"]["current_page"];
        lastPage = jsonResponse["meta"]["last_page"];

        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        print(response.toString());
        loader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }


  Future<InvoiceDetailsModel?> getInvoiceDetails(int invoiceId) async{

    var response= await server.getRequest(endPoint: APIList.invoiceDetails!+"${invoiceId}");
    if (response != null && response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return InvoiceDetailsModel.fromJson(jsonResponse["data"]);
    } else {
      Get.showSnackbar(GetSnackBar(message: "Invoice Details Failed To Load",));
      return null;
    }

  }

}