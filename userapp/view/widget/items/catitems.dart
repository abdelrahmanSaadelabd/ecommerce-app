import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled1/controller/Iitemscontroller/items_controller.dart';

import 'package:untitled1/controller/core/constant/colors.dart';

class Catitems extends StatelessWidget {
  final double height;
  final double width;
  const Catitems({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());
    appColor appcolor = Get.put(appColor());
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(controller.categries.length, (i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      controller
                          .onchangecat(
                            i,
                            controller.categries[i]["categories_id"],
                          )
                          .toString();
                    },
                    child: GetBuilder<ItemsController>(
                      builder:
                          (controller) => Container(
                            decoration:
                                controller.selcetedcate == i
                                    ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: appcolor.iconcolor,
                                          width: 3,
                                        ),
                                      ),
                                    )
                                    : null,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                                right: 10,
                                left: 10,
                                top: 20,
                              ),
                              child: Text(
                                "${controller.categries[i]["categories_name"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color:
                                      controller.selcetedcate == i
                                          ? appcolor.iconcolor
                                          : Colors.white,
                                ),
                              ),
                            ),
                          ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
