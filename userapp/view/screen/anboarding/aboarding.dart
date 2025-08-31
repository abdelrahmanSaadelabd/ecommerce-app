import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/anboardingcontroller/controller_onboarding.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/view/widget/onboarding/controller.dart';
import 'package:untitled1/view/widget/onboarding/pageview.dart';

class Aboarding extends StatelessWidget {
  const Aboarding({super.key});
  @override
  Widget build(BuildContext context) {
    MyServices Myservices = Get.find();
    Get.put(onbaordingcontrollerimpt());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Obx(() {
          final controller = Get.find<onbaordingcontrollerimpt>();
          bool isYellowTop =
              controller.currentpage == 0 || controller.currentpage == 2;
          return AppBar(
            backgroundColor:
                isYellowTop
                    ? Color.fromARGB(255, 255, 196, 0)
                    : Color(0xFFFAFAFA),
            elevation: 0,
          );
        }),
      ),
      body: Container(
        color: const Color.fromARGB(255, 254, 249, 249),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(child: onboardingpagevie()),
                  SizedBox(height: 8),

                  Controlleronboarding(),
                ],
              ),
              TextButton(
                onPressed: () {
                  Myservices.sharedPreferences.setString("step", "1");
                  Get.offAllNamed("/loginpage");
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
