import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/cartcontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';

class Bottombarcard extends StatelessWidget {
  final height;
  final width;
  const Bottombarcard({super.key, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    cartcontroller controllercoupon = Get.find();

    return Container(
      height:
          controllercoupon.coupondiscound > 0 ? height * 0.3 : height * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            spreadRadius: 10,
            offset: Offset(3, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: GetBuilder<cartcontroller>(
                builder:
                    (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "total (${controller.totalItemCount})",
                          style: TextStyle(
                            fontSize: height * .03,
                            color: appcolor.iconcolor,

                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Flexible(
                          child: Container(
                            child: Text(
                              "\$${controller.totalCartPrice.toStringAsFixed(1)}",
                              style: TextStyle(
                                fontSize: height * .03,
                                color: appcolor.appbarcolor,

                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
            ...(controllercoupon.coupondiscound > 0
                ? [
                  Flexible(
                    flex: 1,
                    child: GetBuilder<cartcontroller>(
                      builder:
                          (controller) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                "Coupon discound",
                                style: TextStyle(
                                  fontSize: height * .03,
                                  color: appcolor.iconcolor,

                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.coupondiscound}&",
                                    style: TextStyle(
                                      fontSize: height * .03,
                                      color: appcolor.appbarcolor,

                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: GetBuilder<cartcontroller>(
                      builder:
                          (controller) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                "Price after coupon",
                                style: TextStyle(
                                  fontSize: height * .03,
                                  color: appcolor.iconcolor,

                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "\$${controller.totalCartPriceafterdiscound.toStringAsFixed(1)}",
                                    style: TextStyle(
                                      fontSize: height * .03,
                                      color: appcolor.appbarcolor,

                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                ]
                : []),
            Expanded(
              flex: 1,
              child: Text(
                "Thank you for choosing our products!",
                style: TextStyle(
                  fontSize: height * .02,
                  color: Colors.grey[400],

                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            GetBuilder<cartcontroller>(
              builder:
                  (controller) => Flexible(
                    flex: 1,
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          controller.gotocheckout();
                        },
                        child: Container(
                          width: width * .7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                Color.fromARGB(255, 255, 212, 69),
                                Color.fromARGB(255, 255, 225, 127),
                                Color.fromARGB(255, 255, 222, 112),
                                Color.fromARGB(255, 255, 230, 149),
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
            ),
          ],
        ),
      ),
    );
  }
}
