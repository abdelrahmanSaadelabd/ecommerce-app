import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/Iitemscontroller/items_controller.dart';

import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/homecontroller/scearchhomecontroller.dart';
import 'package:untitled1/view/screen/home/scearchHome.dart';
import 'package:untitled1/view/widget/home//search.dart';
import 'package:untitled1/view/widget/items/catitems.dart';
import 'package:untitled1/view/widget/items/iconnotifcationall.dart';
import 'package:untitled1/view/widget/items/prodectithems.dart';

class Itemsscreen extends StatelessWidget {
  const Itemsscreen({super.key});

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
              "Items",
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: GetBuilder<Scearchhomecontroller>(
                            init: Scearchhomecontroller(),
                            builder:
                                (controller) => Search(
                                  onTap: () => controller.getData(),
                                  controller: controller.scearch,
                                  height: height,
                                  width: width,
                                  onChanged: (val) {
                                    controller.changestatusScearch(val);
                                  },
                                  onscearch: () {
                                    controller.onScearch();
                                  },
                                ),
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Expanded(
                          flex: 1,
                          child: Iconnotifcationall(
                            height: height,
                            width: width,
                          ),
                        ),
                      ],
                    ),
                  ),

                  GetBuilder<Scearchhomecontroller>(
                    builder:
                        (controller) => Expanded(
                          child:
                              controller.isscearch
                                  ? Scearchhome()
                                  : SizedBox(
                                    height: height,
                                    width: width,
                                    child: Column(
                                      children: [
                                        Catitems(height: height, width: width),
                                        GetBuilder<ItemsController>(
                                          builder:
                                              (controller) => HandlingDataView(
                                                statusRequst:
                                                    controller.statusRequst,
                                                widget: Prodectithems(
                                                  height: height,
                                                  width: width,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
