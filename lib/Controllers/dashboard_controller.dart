import 'dart:convert';
import '../Models/dashboard_model.dart';
import '../Models/news_offers_model.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  UserService userService = UserService();
  Server server = Server();

  String? userID;

  bool dashboardLoader = true;
  bool commonLoader = false;
  bool loader = false;
  late DataDashboard dashboardData;
  List<NewsOffers> offersList = <NewsOffers>[];


  @override
  void onInit() {
    getDashboard();
    getOfferList();
    super.onInit();
  }

  getDashboard() {
    server.getRequest(endPoint: APIList.dashboard).then((response) {
      if (response != null && response.statusCode == 200) {
        dashboardLoader = false;
        final jsonResponse = json.decode(response.body);
        var dashboard = DashboardModel.fromJson(jsonResponse);
        dashboardData = dashboard.data!;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        dashboardLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  getOfferList() {
    offersList = <NewsOffers>[];
    server.getRequest(endPoint: APIList.offerList).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var offers = NewsOffersModel.fromJson(jsonResponse);
        offersList = offers.data!.newsOffers!;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else {
        dashboardLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }
}
