import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:untitled1/controller/core/constant/colors.dart';

class Iconnotifcationall extends StatelessWidget {
  const Iconnotifcationall({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    return Container(
      width: width * 0.14,
      height: height * 0.05,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 245, 226),

        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.notifications_active,
        color: appcolor.iconcolor,
        size: 30,
      ),
    );
  }
}
