import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:untitled1/controller/Iitemscontroller/productcontroller.dart';

class Nameandprice extends StatelessWidget {
  final double height;
  final double width;
  const Nameandprice({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    Productcontroller controller = Get.find<Productcontroller>();
    int currentItemId = controller.product[controller.selcetitems]["items_id"];
    bool isdiscound = controller.discound[currentItemId] > 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            "${controller.product[controller.selcetitems]["items_name"]}",

            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: height * 0.04,
          width: width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 255, 215, 83),
                Color.fromARGB(255, 255, 208, 52),
                Color.fromARGB(255, 255, 210, 61),
                Color.fromARGB(255, 255, 206, 43),
              ],
            ),
          ),
          child: Center(
            child:
                isdiscound
                    ? Text(
                      "\$${controller.product[controller.selcetitems]["itempricediscount"]}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                    : Text(
                      "\$${controller.product[controller.selcetitems]["items_price"]}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
          ),
        ),
      ],
    );
  }
}
