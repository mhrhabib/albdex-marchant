import 'dart:convert';
import '../Models/deliveryCharge_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class DeliveryChargeController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  List<DeliveryCharges> deliveryChargesList = <DeliveryCharges>[];



  @override
  void onInit() {
    getDeliveryCharge();
    super.onInit();
  }

  getDeliveryCharge() {
    server.getRequest(endPoint: APIList.deliverycharges).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var deliveryCData = DeliveryChargeModel.fromJson(jsonResponse);
        deliveryChargesList = <DeliveryCharges>[];
        deliveryChargesList.addAll(deliveryCData.data!.deliveryCharges!);
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
