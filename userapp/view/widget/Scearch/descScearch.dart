import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/homecontroller/scearchhomecontroller.dart';

class Descscearch extends StatelessWidget {
  final i;
  const Descscearch({super.key, this.i});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    Scearchhomecontroller controller = Get.find();
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.product[i]["items_name"]}",
            style: TextStyle(
              color: appcolor.iconcolor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${controller.product[i]["categories_name"]}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
