import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled1/controller/homecontroller/scearchhomecontroller.dart';
import 'package:untitled1/view/screen/home/scearchHome.dart';
import 'package:untitled1/view/widget/home/categroy.dart';
import 'package:untitled1/view/widget/home/offers.dart';
import 'package:untitled1/view/widget/home/prodectforyou.dart';
import 'package:untitled1/view/widget/home/seealltext.dart';

class HomeViewcontent extends StatelessWidget {
  final double height;
  final double width;

  const HomeViewcontent({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    Scearchhomecontroller controller = Get.find();

    return GetBuilder<Scearchhomecontroller>(
      builder:
          (_) =>
              controller.isscearch
                  ? Scearchhome()
                  : Container(
                    height: height,

                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#Special for you",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Offers(height: height, width: width),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#Category",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                    Seealltext(),
                                  ],
                                ),
                              ),
                              Categroy(height: height, width: width),
                            ],
                          ),

                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#Top Selling",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Prodectforyou(height: height, width: width),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
    );
  }
}
