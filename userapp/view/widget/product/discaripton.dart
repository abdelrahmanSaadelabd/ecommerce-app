import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/productcontroller.dart';

class Discaripton extends StatelessWidget {
  final double height;
  final double width;
  const Discaripton({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    Productcontroller controller = Get.find<Productcontroller>();

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: height * .2,
        width: width,

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Description:",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${controller.product[controller.selcetitems]["items_datatime"]}",
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${controller.product[controller.selcetitems]["items_desc"]}",
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
