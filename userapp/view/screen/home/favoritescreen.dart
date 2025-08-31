import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/favotite.dart';

import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/view/widget/favorite/prodectfavorite.dart';

class Favoritescreen extends StatelessWidget {
  const Favoritescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        appColor appcolor = Get.put(appColor());
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: appcolor.appbarcolor,
            title: Text(
              "Favorite",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: appcolor.iconcolor),
            ),
          ),
          body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [appcolor.appbarcolor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                GetBuilder<Favotitecontroller>(
                  init: Favotitecontroller(),
                  builder:
                      (controller) => HandlingDataView(
                        statusRequst: controller.statusRequst,
                        widget: Prodectfavorite(height: height, width: width),
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
