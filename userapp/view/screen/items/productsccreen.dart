import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/Iitemscontroller/productcontroller.dart';

import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';

import 'package:untitled1/view/widget/product/bottombar.dart';

import 'package:untitled1/view/widget/product/discaripton.dart';

import 'package:untitled1/view/widget/product/productdit.dart';

class Productsccreen extends StatelessWidget {
  const Productsccreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Productcontroller());
    return LayoutBuilder(
      builder: (context, constraints) {
        appColor appcolor = Get.put(appColor());
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        return Scaffold(
          bottomNavigationBar: Bottombar(height: height, width: width),
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: appcolor.appbarcolor,
            title: Text(
              "product",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: appcolor.iconcolor),
            ),
          ),
          body: GetBuilder<Productcontroller>(
            builder:
                (controller) => Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [appcolor.appbarcolor, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: HandlingDataView(
                    statusRequst: controller.statusRequst,
                    widget: Column(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Productdit(height: height, width: width),
                        ),
                        Flexible(
                          flex: 1,
                          child: Discaripton(height: height, width: width),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}
