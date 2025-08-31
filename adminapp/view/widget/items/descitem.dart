import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Descitem extends StatelessWidget {
  final i;
  final controller;
  const Descitem({super.key, this.i, this.controller});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${controller.items[i]["items_name"].toString().characters.take(7)}",

          style: TextStyle(
            color: appcolor.iconcolor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        Text(
          "${controller.items[i]["items_datatime"].toString().characters.take(10)}",

          style: TextStyle(
            color: appcolor.appbarcolor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
