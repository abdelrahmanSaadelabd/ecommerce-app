import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:untitled1/controller/Iitemscontroller/offercontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';

import 'package:untitled1/view/widget/offere/prodectoffer.dart';

class Offerscrean extends StatelessWidget {
  const Offerscrean({super.key});

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
              "Offers",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: appcolor.iconcolor),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [appcolor.appbarcolor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: GetBuilder<Offercontroller>(
              init: Offercontroller(),
              builder:
                  (controller) => HandlingDataView(
                    statusRequst: controller.statusRequst,
                    widget: Prodectoffer(
                      height: height,
                      width: width,
                      controller: controller,
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
