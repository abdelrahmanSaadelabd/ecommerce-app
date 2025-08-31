import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/cartcontroller.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Imagepart extends StatelessWidget {
  final i;
  const Imagepart({super.key, this.i});

  @override
  Widget build(BuildContext context) {
    cartcontroller controller = Get.find();

    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            "${appLink.imagenitemsview}/${controller.cart[i]["items_image"]}",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
