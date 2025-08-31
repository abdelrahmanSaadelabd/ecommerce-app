import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/alert_exit_app.dart';
import 'package:adminapp/controller/login/logincontroller.dart';
import 'package:adminapp/view/widget/auth/login/logincontent.dart';
import 'package:adminapp/view/widget/auth/login/titel_body_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeught = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeught * .2,
      width: screenWidth,
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: appcolor.appbarcolor,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: GetBuilder<Logincontroller>(
          builder:
              (controller) => WillPopScope(
                onWillPop: () => alertexitapp(context),

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitelBodyLogin(
                        titelScreenAUTH: "login",
                        bodyscreanAUTH: "Wolecom Back",
                      ),
                      SizedBox(height: screenHeught * .05),
                      SizedBox(
                        height: screenHeught,
                        width: screenWidth,
                        child: Logincontent(
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
      ),
    );
  }
}
