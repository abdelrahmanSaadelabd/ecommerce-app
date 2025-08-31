import 'package:deliveryapp/view/screen/home/orders/order_accepted.dart';
import 'package:deliveryapp/view/screen/home/orders/ordersscreen.dart';
import 'package:deliveryapp/view/screen/home/setting/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  int currentpage = 0;

  @override
  void onInit() async {
    super.onInit();
  }

  List<Widget> pageslist = [Ordersscreen(), order_accepted(), SettingsScreen()];

  List<IconData> iconpages = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.truck,
    FontAwesomeIcons.cog,
  ];
  changpages(int i) {
    currentpage = i;
    update();
  }
}
