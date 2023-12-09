import 'dart:convert';
import '../Models/codCharge_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class CodChargeController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  List<CodChargesData> codChargesList = <CodChargesData>[];



  @override
  void onInit() {
    getCodCharge();
    super.onInit();
  }

  getCodCharge() {
    server.getRequest(endPoint: APIList.codcharges).then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var codCData = CodChargeModel.fromJson(jsonResponse);
        codChargesList = <CodChargesData>[];
        codChargesList.addAll(codCData.data!.codCharges!);
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
