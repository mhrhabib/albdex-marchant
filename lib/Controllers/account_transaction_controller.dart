import 'dart:convert';
import '../Models/account_transaction_model.dart';
import '../services/api-list.dart';
import '../services/server.dart';
import 'package:get/get.dart';
import '../services/user-service.dart';

class AccountTransactionController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = true;
  List<Transactions> accountTransactionList = <Transactions>[];

  @override
  void onInit() {
    getAccountTransaction();
    super.onInit();
  }

  getAccountTransactionList() async {
    loader = true;
    Future.delayed(Duration(milliseconds: 10), () {
      update();
    });
    getAccountTransaction();
  }

  getAccountTransaction() {
    server
        .getRequest(endPoint: APIList.accountTransactionList)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        loader = false;
        final jsonResponse = json.decode(response.body);
        var accountTransactionData =
            AccountTransactionModel.fromJson(jsonResponse);
        accountTransactionList = <Transactions>[];
        accountTransactionList
            .addAll(accountTransactionData.data!.transactions!);
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
