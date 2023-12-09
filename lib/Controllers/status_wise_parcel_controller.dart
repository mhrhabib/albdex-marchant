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

class StatusWiseParcelController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  final int statusId;
  int currentPage = 1;
  int lastPage = 2;
  List<ParcelModel> parcelList = <ParcelModel>[];


  StatusWiseParcelController({required this.statusId});

  @override
  void onInit() {
    super.onInit();
    getParcelList(statusId);
  }

  getNextParcelList() async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getParcelList(statusId,page: currentPage+1);
  }

  getParcelList(int statusId,{int page = 1}) {
    server.getRequest(endPoint: APIList.parcelListStatus!+"${statusId}?page=${page}").then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        for(int i=0; i< jsonResponse["data"].length; i++){
          parcelList.add(ParcelModel.fromJson(jsonResponse['data'][i]));
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

}