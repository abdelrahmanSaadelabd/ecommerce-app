import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/view/screen/home/itmes/edietitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Eidetdaelet extends StatelessWidget {
  final i;
  final controller;
  const Eidetdaelet({super.key, this.i, this.controller});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              controller.delet(
                controller.items[i]["items_id"],
                controller.items[i]["extra_images"],
                controller.items[i]["main_image"],
              );
            },
            child: Icon(
              Icons.delete_sweep_rounded,
              size: 35,
              color: appcolor.iconcolor,
            ),
          ),
          InkWell(
            onTap: () {
              controller.gotoeidet(controller.items[i]);
            },
            child: Icon(
              Icons.edit_calendar_sharp,
              size: 30,
              color: appcolor.iconcolor,
            ),
          ),
        ],
      ),
    );
  }
}
