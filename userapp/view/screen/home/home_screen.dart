import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/alert_exit_app.dart';
import 'package:untitled1/controller/homecontroller/home_controller.dart';
import 'package:untitled1/controller/homecontroller/home_screen_controller.dart';
import 'package:untitled1/controller/homecontroller/scearchhomecontroller.dart';

import 'package:untitled1/view/widget/home/bottomnavigationbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    Get.put<HomeScreenController>(HomeScreenController(), permanent: true);
    Get.put<Scearchhomecontroller>(Scearchhomecontroller(), permanent: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        return GetBuilder<HomeScreenController>(
          builder:
              (controller) => WillPopScope(
                onWillPop: () => alertexitapp(context),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    backgroundColor: appcolor.appbarcolor,
                    elevation: 0,
                    toolbarHeight: 0,
                  ),
                  bottomNavigationBar: Bottomnavigationbar(),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: appcolor.appbarcolor,
                    shape: CircleBorder(),
                    onPressed: () {
                      Get.toNamed("/cart");
                    },
                    child: FaIcon(
                      Icons.add_shopping_cart,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  body:
                      (controller.pageslist.isNotEmpty &&
                              controller.currentpage <
                                  controller.pageslist.length)
                          ? controller.pageslist.elementAt(
                            controller.currentpage,
                          )
                          : const Center(child: CircularProgressIndicator()),
                ),
              ),
        );
      },
    );
  }
}
