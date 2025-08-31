import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Descpart extends StatelessWidget {
  final i;
  final controller;
  const Descpart({super.key, this.i, this.controller});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${controller.categroys[i]["categories_name"].toString().characters.take(10)}",

          style: TextStyle(
            color: appcolor.iconcolor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        Text(
          "${controller.categroys[i]['categories_datatime'].toString().characters.take(10)}",

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
