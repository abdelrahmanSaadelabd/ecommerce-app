import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/productcontroller.dart';

class Colorandcount extends StatelessWidget {
  final double height;
  final double width;
  const Colorandcount({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    Productcontroller controller = Get.find<Productcontroller>();
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<Productcontroller>(
            builder: (controller) {
              int currentItemId =
                  controller.product[controller.selcetitems]["items_id"];
              bool isFav = controller.favorite[currentItemId] == 1;

              return IconButton(
                onPressed: () {
                  controller.setFavorite(currentItemId, isFav ? 0 : 1);
                  controller.sentfavorite(controller.selcetitems);
                },
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.grey,
                  size: 50,
                ),
              );
            },
          ),
          Row(
            children: [
              Text("count:", style: TextStyle(fontSize: 20)),
              Text(
                " ${controller.product[controller.selcetitems]["items_count"]}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
