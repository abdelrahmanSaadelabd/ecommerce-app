import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';
import 'package:untitled1/controller/auth_controller/forgitpassord_controller/checkcodeforgitpasswordcontroller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/view/widget/auth/forgetpassword/popup_opt_forgitpassword.dart';

class ShowPupupForgitpassword extends StatelessWidget {
  final String? email;
  const ShowPupupForgitpassword({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    Get.put(Checkcodeforgitpasswordcontroller(email!));
    return GetBuilder<Checkcodeforgitpasswordcontroller>(
      builder:
          (controller) => handlingRqust(
            statusRequst: controller.statusRequst ?? StatusRequst.none,
            widget: CustomDialog(
              content: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "the activation code has been sent to the email, please check the email",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 128, 128, 128),
                      ),
                    ),
                    SizedBox(height: 10),
                    Pinput(
                      controller: controller.code,
                      length: 6,
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
          ),
    );
  }
}
