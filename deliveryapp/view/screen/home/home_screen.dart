import 'package:deliveryapp/controller/core/constant/colors.dart';
import 'package:deliveryapp/controller/core/functions/alert_exit_app.dart';
import 'package:deliveryapp/controller/homecontroller/home_controller.dart';
import 'package:deliveryapp/controller/homecontroller/home_screen_controller.dart';
import 'package:deliveryapp/view/widget/home/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    Get.put<HomeScreenController>(HomeScreenController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);

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
