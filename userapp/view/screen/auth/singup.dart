import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

import 'package:untitled1/controller/auth_controller/singup_controller/singup_controller.dart';

import 'package:untitled1/view/widget/auth/login/titel_body_login.dart';
import 'package:untitled1/view/widget/auth/singup/singupcontent.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SingupController());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeught = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 255, 196, 0),
            Color.fromARGB(255, 254, 203, 36),
            Color.fromRGBO(255, 214, 81, 1),
            Color.fromARGB(255, 255, 217, 92),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        backgroundColor: Colors.transparent,

        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 196, 0),
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: GetBuilder<SingupController>(
          builder:
              (controller) => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TitelBodyLogin(
                      titelScreenAUTH: "Sing Up",
                      bodyscreanAUTH: "Grate acount with email and password",
                    ),
                    SizedBox(height: screenHeught * .05),
                    SizedBox(
                      height: screenHeught,
                      width: screenWidth,
                      child: SignupFormContent(
                        controller: controller,

                        screenHeught: screenHeught,
                        screenWidth: screenWidth,
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
