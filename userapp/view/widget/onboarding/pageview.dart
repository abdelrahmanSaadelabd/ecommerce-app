import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/anboardingcontroller/controller_onboarding.dart';
import 'package:untitled1/controller/data/datasours/static/static.dart';
import 'package:untitled1/view/widget/auth/login/backgroundlogin.dart';
import 'package:untitled1/view/widget/onboarding/partimage.dart';

class onboardingpagevie extends GetView<onbaordingcontrollerimpt> {
  const onboardingpagevie({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onbroadinglist.length,
      onPageChanged: (value) {
        controller.changpage(value);
      },
      itemBuilder: (context, index) {
        final data = onbroadinglist[index];
        final isYellowTop = index == 0 || index == 2;

        return Column(
          children: [
            Expanded(
              flex: 1,
              child:
                  isYellowTop
                      ? Backgroundlogin(data: data, status: isYellowTop)
                      : Container(
                        color: Color(0xFFFAFAFA),
                        child: buildImageSection(data),
                      ),
            ),
            Expanded(
              flex: 1,
              child:
                  isYellowTop
                      ? Container(
                        color: Color(0xFFFAFAFA),
                        child: buildImageSection(data),
                      )
                      : Backgroundlogin(data: data, status: isYellowTop),
            ),
          ],
        );
      },
    );
  }
}
