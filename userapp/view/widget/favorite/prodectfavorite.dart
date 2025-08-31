import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/controller/Iitemscontroller/favotite.dart';

import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/constant/image.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';

import 'package:untitled1/linkapi/link_api.dart';

class Prodectfavorite extends StatelessWidget {
  const Prodectfavorite({
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

    return GetBuilder<Favotitecontroller>(
      init: Favotitecontroller(),
      builder: (controller) {
        return Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: width / 2,
              mainAxisSpacing: 40,
              crossAxisSpacing: 20,
              childAspectRatio: width / (height * 1),
            ),
            itemCount: controller.Favorite.length,
            itemBuilder: (context, i) {
              int currentItemId = controller.Favorite[i]["items_id"];
              bool isdiscound = controller.discound[currentItemId] > 0;
              controller.favoritemap[controller.Favorite[i]["items_id"]
                      .toString()] =
                  controller.Favorite[i]["favorite"];
              return Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 245, 226),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: InkWell(
                        onTap: () {
                          controller.gotoproduct(
                            0,
                            controller.Favorite[i]["items_id"].toString(),
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
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  "${appLink.imagenitemsview}/${controller.Favorite[i]["items_image"]}",
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
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

                    Expanded(
                      flex: 1,
                      child: Text(
                        "${controller.Favorite[i]["items_name"]}",
                        style: TextStyle(
                          color: appcolor.iconcolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${controller.Favorite[i]["items_desc"]}",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child:
                                  isdiscound
                                      ? Text(
                                        maxLines: 1,
                                        "\$${controller.Favorite[i]["itempricediscount"].toStringAsFixed(1)}",
                                        style: TextStyle(
                                          color: appcolor.iconcolor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                      : Text(
                                        "\$${controller.Favorite[i]["items_price"].toStringAsFixed(1)}",
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
                                        "\$${controller.Favorite[i]["items_price"].toStringAsFixed(1)}",
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
                              child: GetBuilder<Favotitecontroller>(
                                builder: (controller) {
                                  int currentItemId =
                                      controller.Favorite[i]["items_id"];
                                  bool isFav =
                                      controller.favoritemap[currentItemId] ==
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
                                      color: isFav ? Colors.red : Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GetBuilder<Favotitecontroller>(
                      builder: (controller) {
                        int currentItemId = controller.Favorite[i]["items_id"];
                        bool iscart = controller.cart[currentItemId] == 1;

                        return HandlingDataView(
                          statusRequst: controller.statusRequst,
                          widget: Expanded(
                            flex: 2,
                            child: MaterialButton(
                              onPressed: () {
                                controller.setcart(
                                  currentItemId,
                                  iscart ? 0 : 1,
                                );
                                controller.senttocart(i);
                              },
                              child: Container(
                                height: height * 0.05,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    colors: [
                                      Color.fromARGB(255, 255, 212, 69),
                                      Color.fromARGB(255, 255, 225, 127),
                                      Color.fromARGB(255, 255, 222, 112),
                                      Color.fromARGB(255, 255, 230, 149),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child:
                                      iscart
                                          ? Text(
                                            "Remove",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.copyWith(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                          : Text(
                                            "Add to cart",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.copyWith(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
