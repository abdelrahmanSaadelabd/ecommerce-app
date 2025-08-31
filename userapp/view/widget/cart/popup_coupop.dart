import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/cartcontroller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/constant/image.dart';
import 'package:untitled1/view/widget/cart/customdialogcoupon.dart';

class PopupCoupop extends StatelessWidget {
  const PopupCoupop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<cartcontroller>(
      builder:
          (controller) =>
              controller.statusRequst == StatusRequst.loading
                  ? Center(
                    child: LottieBuilder.asset(
                      APPimage.sendcode,
                      height: 500,
                      width: 500,
                    ),
                  )
                  : Customdialogcoupon(
                    content: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Enter Name coupon",
                            style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 128, 128, 128),
                            ),
                          ),

                          SizedBox(height: 10),

                          TextFormField(
                            controller: controller.namecoupon,
                            decoration: InputDecoration(
                              hintText: "Coupon",
                              filled: true,
                              focusColor: Colors.amberAccent,
                              fillColor: const Color.fromARGB(
                                255,
                                255,
                                247,
                                215,
                              ),
                              hoverColor: Colors.amberAccent,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      controller.checkcoupon();
                      Get.back();
                    },

                    dilogiconcolor: Color.fromARGB(255, 255, 196, 0),
                    titledilog: "Coupon!",
                    fontsize: 25,
                    Colortitle: const Color.fromARGB(255, 129, 99, 1),
                    contentdilog: "Enter the special code sent",
                    namebottomdilog1: "Send",
                  ),
    );
  }
}
