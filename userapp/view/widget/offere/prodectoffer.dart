import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'package:untitled1/controller/Iitemscontroller/offercontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/constant/image.dart';

import 'package:untitled1/linkapi/link_api.dart';

class Prodectoffer extends StatelessWidget {
  const Prodectoffer({
    super.key,
    required this.height,
    required this.width,
    re,
    this.controller,
  });
  final double height;
  final double width;
  final controller;

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.items.length,
      itemBuilder: (context, i) {
        int currentItemId = controller.items[i]["items_id"];
        bool isdiscound = controller.discound[currentItemId] > 0;
        return Container(
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 245, 226),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  controller.gotoproduct(
                    controller.items,
                    i,
                    controller.items[i]["items_id"].toString(),
                  );
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: height * .35,
                          child: Image.network(
                            "${appLink.imagenitemsview}/${controller.items[i]["items_image"]}",
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    if (isdiscound)
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 100,
                          width: 100,
                          child: LottieBuilder.asset(
                            APPimage.sale,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                "${controller.items[i]["items_name"]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "${controller.items[i]["items_desc"]}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 8),
              Container(
                color: const Color.fromARGB(76, 252, 219, 121),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    isdiscound
                        ? Text(
                          "\$${controller.items[i]["itempricediscount"].toStringAsFixed(1)}",
                          style: TextStyle(
                            color: appcolor.iconcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        : Text(
                          "\$${controller.items[i]["items_price"].toStringAsFixed(1)}",
                          style: TextStyle(
                            color: appcolor.iconcolor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    if (isdiscound)
                      Stack(
                        children: [
                          Text(
                            "\$${controller.items[i]["items_price"].toStringAsFixed(1)}",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: 60,
                            ),
                          ),
                        ],
                      ),
                    IconButton(
                      onPressed: () {
                        controller.setFavorite(
                          currentItemId,
                          controller.favorite[currentItemId] == 1 ? 0 : 1,
                        );
                        controller.sentfavorite(i);
                      },
                      icon: Icon(
                        size: 40,
                        controller.favorite[currentItemId] == 1
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            controller.favorite[currentItemId] == 1
                                ? Colors.red
                                : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
