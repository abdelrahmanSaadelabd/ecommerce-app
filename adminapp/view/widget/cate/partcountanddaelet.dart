import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Partcountanddaelet extends StatelessWidget {
  final i;
  final void Function()? onTap;
  final controller;
  final controllercategroyid;
  final controllernamecate;
  final oldimage;
  const Partcountanddaelet({
    super.key,
    this.i,
    this.controller,
    this.controllercategroyid,
    this.controllernamecate,
    this.oldimage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.delete_sweep_rounded,
              size: 35,
              color: appcolor.iconcolor,
            ),
          ),

          InkWell(
            onTap: () {
              controller.gotoeidet(
                controllercategroyid,
                controllernamecate,
                oldimage,
              );
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
