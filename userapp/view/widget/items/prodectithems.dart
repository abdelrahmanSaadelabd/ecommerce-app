import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import 'package:untitled1/controller/Iitemscontroller/items_controller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/constant/image.dart';

import 'package:untitled1/linkapi/link_api.dart';

class Prodectithems extends StatelessWidget {
  const Prodectithems({
    super.key,
    required this.height,
    required this.width,
    re,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return GetBuilder<ItemsController>(
      builder:
          (controller) => Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: width / 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 20,
                childAspectRatio: width / (height * 0.82),
              ),
              itemCount: controller.items.length,
              itemBuilder: (context, i) {
                int currentItemId = controller.items[i]["items_id"];
                bool isdiscound = controller.discound[currentItemId] > 0;
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 245, 226),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            controller.gotoproduct(
                              controller.items,
                              i,
                              controller.items[i]["items_id"].toString(),
                            );
                          },
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: LottieBuilder.asset(
                                    APPimage.sale,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  width: 200,
                                  height: 100,
                                  "${appLink.imagenitemsview}/${controller.items[i]["items_image"]}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              if (isdiscound)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: LottieBuilder.asset(
                                      APPimage.sale,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "${controller.items[i]["items_name"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${controller.items[i]["items_desc"]}",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        color: const Color.fromARGB(76, 252, 219, 121),
                        child: GetBuilder<ItemsController>(
                          builder: (controller) {
                            int currentItemId = controller.items[i]["items_id"];
                            bool isdiscound =
                                controller.discound[currentItemId] > 0;

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child:
                                      isdiscound
                                          ? Text(
                                            maxLines: 1,
                                            "\$${controller.items[i]["itempricediscount"].toStringAsFixed(1)}",
                                            style: TextStyle(
                                              color: appcolor.iconcolor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                          : Text(
                                            "\$${controller.items[i]["items_price"].toStringAsFixed(1)}",
                                            maxLines: 1,

                                            style: TextStyle(
                                              color: appcolor.iconcolor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                ),
                                if (isdiscound == true)
                                  Flexible(
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Text(
                                            "\$${controller.items[i]["items_price"].toStringAsFixed(1)}",
                                            maxLines: 1,

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
                                    ),
                                  ),

                                Flexible(
                                  child: GetBuilder<ItemsController>(
                                    builder: (controller) {
                                      int currentItemId =
                                          controller.items[i]["items_id"];
                                      bool isFav =
                                          controller.favorite[currentItemId] ==
                                          1;

                                      return IconButton(
                                        onPressed: () {
                                          controller.setFavorite(
                                            currentItemId,
                                            isFav ? 0 : 1,
                                          );
                                          controller.sentfavorite(i);
                                        },
                                        icon: Icon(
                                          isFav
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color:
                                              isFav ? Colors.red : Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
    );
  }
}
