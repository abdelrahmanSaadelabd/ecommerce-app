import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/Iitemscontroller/productcontroller.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';

class Bottombar extends StatelessWidget {
  final double height;
  final double width;
  const Bottombar({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Productcontroller>(
      builder:
          (controller) => HandlingDataView(
            statusRequst: controller.statusRequst,
            widget: Container(
              height: height * 0.143,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 255, 245, 226),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    spreadRadius: 10,
                    offset: Offset(3, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.Totolprice();
                              },
                              icon: Icon(
                                Icons.do_not_disturb_on_total_silence_sharp,
                              ),
                            ),
                            Text("${controller.count}"),
                            IconButton(
                              onPressed: () {
                                controller.Totolpriceplus();
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "totol: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                "${controller.totolprice}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: GetBuilder<Productcontroller>(
                      builder: (controller) {
                        int currentItemId =
                            controller.product[controller
                                .selcetitems]["items_id"];
                        bool iscart = controller.cart[currentItemId] == 1;

                        return HandlingDataView(
                          statusRequst: controller.statusRequst,
                          widget: MaterialButton(
                            onPressed: () {
                              controller.setCart(currentItemId, iscart ? 0 : 1);
                              controller.senttocart(controller.selcetitems);
                            },
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                                          "Remove from cart",
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
