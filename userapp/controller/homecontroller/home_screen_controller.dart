import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/view/screen/home/favoritescreen.dart';
import 'package:untitled1/view/screen/home/home.dart';
import 'package:untitled1/view/screen/home/offerscrean.dart';
import 'package:untitled1/view/screen/home/settings_screen.dart';

class HomeScreenController extends GetxController {
  int currentpage = 0;

  @override
  void onInit() async {
    super.onInit();
  }

  List<Widget> pageslist = [
    homepage(),
    Favoritescreen(),
    Offerscrean(),
    SettingsScreen(),
    Container(child: Center(child: Text("2"))),
  ];

  List<IconData> iconpages = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.solidHeart,

    FontAwesomeIcons.fire,
    FontAwesomeIcons.cog,
  ];
  changpages(int i) {
    currentpage = i;
    update();
  }
}
