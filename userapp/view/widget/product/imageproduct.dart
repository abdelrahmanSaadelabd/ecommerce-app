import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled1/controller/Iitemscontroller/productcontroller.dart';

import 'package:untitled1/linkapi/link_api.dart';

class Imageproduct extends StatelessWidget {
  final double height;
  final double width;
  const Imageproduct({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Productcontroller>(
      builder:
          (controller) => Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(52)),
            height: height * 0.3,
            width: width * 0.85,
            child: PageView.builder(
              onPageChanged: controller.changpage,
              scrollDirection: Axis.horizontal,
              itemCount: controller.product.length,
              itemBuilder: (context, i) {
                final imageName = controller.product[i]["image_one"];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),

                  child: Image.network(
                    "${appLink.imagenitemsview}/$imageName",
                    fit: BoxFit.fill,
                    height: height,
                    width: width,
                  ),
                );
              },
            ),
          ),
    );
  }
}
