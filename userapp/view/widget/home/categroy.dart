import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/homecontroller/home_controller.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Categroy extends StatelessWidget {
  final double height;
  final double width;
  const Categroy({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<HomeController>(
              builder:
                  (controller) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(controller.categories.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () {
                            controller.gotoite(
                              controller.categories,
                              i,
                              controller.categories[i]["categories_id"]
                                  .toString(),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                width: width * .18,
                                height: height * .079,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: const Color.fromARGB(58, 255, 191, 15),
                                ),
                                child: Center(
                                  child: SvgPicture.network(
                                    height: 50,
                                    width: 50,
                                    color: appcolor.iconcolor,
                                    fit: BoxFit.fill,
                                    "${appLink.imagencategries}/${controller.categories[i]["categories_image"]}",
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.categories[i]["categories_name"]}",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
