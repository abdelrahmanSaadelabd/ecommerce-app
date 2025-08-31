import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/cartcontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';

class Descpart extends StatelessWidget {
  final i;
  const Descpart({super.key, this.i});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    cartcontroller controller = Get.find();
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.cart[i]["items_name"]}",
            style: TextStyle(
              color: appcolor.iconcolor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          GetBuilder<cartcontroller>(
            builder: (controller) {
              String itemId = controller.cart[i]["items_id"].toString();
              return Text(
                "\$ ${controller.itemTotalPriceMap[itemId]}",
                style: TextStyle(
                  color: appcolor.appbarcolor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ],
      ),
    );
  }
}
