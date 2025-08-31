import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/anboardingcontroller/controller_onboarding.dart';
import 'package:untitled1/controller/data/datasours/static/static.dart';

class Controlleronboarding extends GetView<onbaordingcontrollerimpt> {
  const Controlleronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onbaordingcontrollerimpt>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onbroadinglist.length,
                (index) => AnimatedContainer(
                  margin: EdgeInsets.only(right: 5),
                  duration: Duration(milliseconds: 600),
                  width: controller.currentpage == index ? 20 : 5,
                  height: 6,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 191, 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
