import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:untitled1/controller/homecontroller/home_controller.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Prodectforyou extends StatelessWidget {
  final double height;
  final double width;
  const Prodectforyou({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
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
                    children: List.generate(controller.itemsview.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () {
                            print("000000000000000000${i}");
                            controller.gotoproduct(
                              controller.itemsview,
                              i,
                              controller.itemsview[i]["items_id"].toString(),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                width: width * .68,
                                height: height * .25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      width: width * .68,
                                      height: height * .25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                        width: width,
                                        "${appLink.imagenitemsview}/${controller.itemsview[i]["items_image"]}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      width: width,
                                      height: height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromARGB(
                                          255,
                                          163,
                                          158,
                                          158,
                                        ).withOpacity(0.3),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "${controller.itemsview[i]["items_name"]}",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
