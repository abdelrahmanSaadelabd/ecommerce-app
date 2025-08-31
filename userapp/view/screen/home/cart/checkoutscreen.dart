import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/checkoutcontroller.dart';

import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/constant/image.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';

import 'package:untitled1/view/widget/cart/checkout/addressshopping.dart';
import 'package:untitled1/view/widget/cart/checkout/cartpayment.dart';
import 'package:untitled1/view/widget/cart/checkout/choosedeliverytyp.dart';

class Checkoutscreen extends StatelessWidget {
  const Checkoutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Checkoutcontroller());

    return LayoutBuilder(
      builder: (context, constraints) {
        appColor appcolor = Get.put(appColor());
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        return Container(
          color: Colors.white,
          height: height,
          width: width,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: appcolor.appbarcolor,
              title: Text(
                "Checkout",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: appcolor.iconcolor),
              ),
            ),
            body: SafeArea(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [appcolor.appbarcolor, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: GetBuilder<Checkoutcontroller>(
                  builder:
                      (controller) => HandlingDataView(
                        statusRequst: controller.statusRequst,
                        widget: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GetBuilder<Checkoutcontroller>(
                                  builder: (controller) {
                                    return SizedBox(
                                      height: height,
                                      width: width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            flex: 0,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                top: height * .01,
                                              ),
                                              child: Text(
                                                maxLines: 1,
                                                "Choose Payment Method",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 0,
                                            child: InkWell(
                                              onTap: () {
                                                controller.choosepaymentmethod(
                                                  "cash",
                                                );
                                              },
                                              child: Cartpayment(
                                                textpayment: "Cash",
                                                Active:
                                                    controller.paymemt == "cash"
                                                        ? true
                                                        : false,
                                                he: height,
                                                we: width,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 0,
                                            child: InkWell(
                                              onTap: () {
                                                controller.choosepaymentmethod(
                                                  "ondelivery",
                                                );
                                              },
                                              child: Cartpayment(
                                                textpayment: "Cash ON Delivery",
                                                Active:
                                                    controller.paymemt ==
                                                            "ondelivery"
                                                        ? true
                                                        : false,
                                                he: height,
                                                we: width,
                                              ),
                                            ),
                                          ),

                                          Flexible(
                                            flex: 0,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                top: height * .04,
                                                bottom: height * 0.01,
                                              ),
                                              child: Text(
                                                maxLines: 1,
                                                "Choose Delivery Type",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ),

                                          Flexible(
                                            flex: 2,
                                            child: SizedBox(
                                              child: Row(
                                                spacing: 15,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller
                                                          .choosedeliverytapy(
                                                            "Delivery",
                                                          );
                                                    },
                                                    child: Choosedeliverytyp(
                                                      Active:
                                                          controller.delivery ==
                                                                  "Delivery"
                                                              ? true
                                                              : false,
                                                      image: APPimage.delivery,
                                                      textdelivery: "Delivery",
                                                      height: height,
                                                      width: width,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller
                                                          .choosedeliverytapy(
                                                            "Pick-up",
                                                          );
                                                    },
                                                    child: Choosedeliverytyp(
                                                      Active:
                                                          controller.delivery ==
                                                                  "Pick-up"
                                                              ? true
                                                              : false,
                                                      image: APPimage.shop,
                                                      textdelivery: "Pick-up",
                                                      height: height,
                                                      width: width,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ...(controller.delivery == "Delivery"
                                              ? [
                                                Flexible(
                                                  flex: 0,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      top: height * .04,
                                                      bottom: height * 0.01,
                                                    ),
                                                    child: Text(
                                                      maxLines: 1,
                                                      "Shipping Address",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                (Flexible(
                                                  flex: 6,
                                                  child: Addressshopping(),
                                                )),
                                              ]
                                              : []),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: height * .77,
                              left: width * .1,
                              child: GetBuilder<Checkoutcontroller>(
                                builder:
                                    (controller) => MaterialButton(
                                      onPressed: () {
                                        controller.gotohomepage();
                                      },
                                      child: Container(
                                        width: width * .7,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            colors: [
                                              Color.fromARGB(255, 255, 212, 69),
                                              Color.fromARGB(
                                                255,
                                                255,
                                                225,
                                                127,
                                              ),
                                              Color.fromARGB(
                                                255,
                                                255,
                                                222,
                                                112,
                                              ),
                                              Color.fromARGB(
                                                255,
                                                255,
                                                230,
                                                149,
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Chackout",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.copyWith(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
