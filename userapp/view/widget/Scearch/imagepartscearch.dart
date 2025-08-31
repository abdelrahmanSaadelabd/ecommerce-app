import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/homecontroller/scearchhomecontroller.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Imagepartscearch extends StatelessWidget {
  final i;
  const Imagepartscearch({super.key, this.i});

  @override
  Widget build(BuildContext context) {
    Scearchhomecontroller controller = Get.find();

    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            "${appLink.imagenitemsview}/${controller.product[i]["items_image"]}",
            height: 130,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
