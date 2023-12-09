import 'dart:convert';
import '/Models/invoice_detials_model.dart';
import '/Models/payment_request_model.dart';
import '/Models/status_wise_parcel_model.dart';
import 'package:flutter/material.dart';

import '../Models/payment_account_list_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class ClearableParcelController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  int currentPage = 1;
  int lastPage = 2;
  List<ParcelModel> parcelList = <ParcelModel>[];


  @override
  void onInit() {
    super.onInit();
    getParcelList();
  }

  getNextParcelList() async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getParcelList(page: currentPage+1);
  }

  getParcelList({int page = 1}) {
    server.getRequest(endPoint: APIList.clearableParcels!+"?page=${page}").then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        print(jsonResponse["data"][0]);

        for(int i=0; i< jsonResponse["data"].length; i++){
          parcelList.add(ParcelModel.fromJson(jsonResponse['data'][i]));
        }

        currentPage = jsonResponse["meta"]?["current_page"]??1;
        lastPage = jsonResponse["meta"]?["last_page"]??1;

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

}