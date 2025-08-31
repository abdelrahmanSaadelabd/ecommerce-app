import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled1/controller/auth_controller/login/checkcodelogin_controller.dart';
import 'package:untitled1/controller/auth_controller/login/logincontroller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/constant/image.dart';

import 'package:untitled1/view/widget/auth/login/popup_opt_login.dart';

class Pupuplogin extends StatelessWidget {
  final String? email;
  const Pupuplogin({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckcodeloginController(email!));

    return GetBuilder<CheckcodeloginController>(
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
                  : CustomDialoglogin(
                    content: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GetBuilder<Logincontroller>(
                            builder:
                                (controller) => Text(
                                  "the activation code has been sent to the email, please check the ${controller.data}",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      128,
                                      128,
                                      128,
                                    ),
                                  ),
                                ),
                          ),
                          SizedBox(height: 10),
                          Pinput(
                            length: 6,
                            controller: controller.code,
                            defaultPinTheme: PinTheme(
                              width: 40,
                              height: 40,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 255, 196, 0),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onCompleted: (pin) async {
                              await controller.postData(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    onPressed1: () async {
                      await controller.postData(context);
                    },

                    dilogiconcolor: Color.fromARGB(255, 255, 196, 0),
                    titledilog: "OTP!",
                    fontsize: 50,
                    Colortitle: Color.fromARGB(255, 255, 196, 0),
                    contentdilog: "Enter the special code sent",
                    namebottomdilog1: "Send",
                  ),
    );
  }
}
