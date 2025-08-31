import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/core/constant/colors.dart';

class Menuicon extends StatelessWidget {
  const Menuicon({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    return Container(
      width: width * 0.14,
      height: height * 0.05,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        FontAwesomeIcons.gripLines,
        color: appcolor.iconcolor,
        size: 30,
      ),
    );
  }
}
