import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/cartcontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';

class Partcountanddaelet extends StatelessWidget {
  final i;
  const Partcountanddaelet({super.key, this.i});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.find();
    cartcontroller controller = Get.find();
    String itemId = controller.cart[i]["items_id"].toString();
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                controller.sentcart(i);
              },
              icon: Icon(
                Icons.delete_sweep_rounded,
                size: 35,
                color: appcolor.appbarcolor,
              ),
            ),
            GetBuilder<cartcontroller>(
              builder:
                  (controller) => Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 242, 208),

                          shape: BoxShape.circle,
                        ),

                        child: Center(
                          child: Text(
                            "${controller.itemCountMap[itemId]}",
                            style: TextStyle(
                              fontSize: 30,
                              color: appcolor.iconcolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
