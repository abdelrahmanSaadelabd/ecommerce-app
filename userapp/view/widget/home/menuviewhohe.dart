import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/homecontroller/scearchhomecontroller.dart';
import 'package:untitled1/view/widget/home/imagebackground.dart';
import 'package:untitled1/view/widget/home/notification_icon.dart';
import 'package:untitled1/view/widget/home/search.dart';
import 'package:untitled1/view/widget/home/textdatahome.dart';

class Menuviewhome extends StatelessWidget {
  final double height;
  final double width;

  const Menuviewhome({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Imagebackground(height: height, width: width),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Flexible(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Textdatahome(),
                  ),
                ),
              ),

              Flexible(
                flex: 1,
                child: Row(
                  spacing: 15,
                  children: [
                    Flexible(
                      flex: 4,
                      child: GetBuilder<Scearchhomecontroller>(
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

                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/notification");
                        },
                        child: NotificationIcon(height: height, width: width),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
