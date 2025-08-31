import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';
import 'package:slide_rating_dialog/slide_rating_dialog.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/orders/archivcontroller.dart';

class Archivorder extends StatelessWidget {
  const Archivorder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        appColor appcolor = Get.put(appColor());
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: appcolor.appbarcolor,
            title: Text(
              "orders Archiv",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: SafeArea(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [appcolor.appbarcolor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GetBuilder<Archivcontroller>(
                  init: Archivcontroller(),
                  builder: (controller) {
                    List orders = [...controller.orders];
                    orders.sort(
                      (a, b) =>
                          b["orders_datetime"].compareTo(a["orders_datetime"]),
                    );
                    return HandlingDataView(
                      statusRequst: controller.statusRequst,
                      widget: ListView.builder(
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orders.length,
                        itemBuilder: (context, i) {
                          int displayNumber = orders.length - i;
                          var order = orders[i];
                          return Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 245, 226),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(
                                    255,
                                    255,
                                    215,
                                    86,
                                  ).withOpacity(0.13),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.receipt_long,
                                            color: appcolor.iconcolor,
                                            size: width * 0.07,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "Order #$displayNumber",
                                            style: TextStyle(
                                              fontSize: width * 0.05,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        Jiffy.parse(
                                          order["orders_datetime"],
                                        ).fromNow(),
                                        style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: appcolor.appbarcolor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 4,
                                    children: [
                                      Chip(
                                        label: Text(
                                          order["orders_delivery_typ"] == 1
                                              ? "Delivery"
                                              : "Pick-Up",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                        avatar: Icon(
                                          Icons.delivery_dining,
                                          size: 18,
                                          color: appcolor.iconcolor,
                                        ),
                                        backgroundColor: Colors.amber[50],
                                      ),
                                      Chip(
                                        label: Text(
                                          order["orders_payment_typ"] == 1
                                              ? "Cash"
                                              : "Cash on Delivery",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                        avatar: Icon(
                                          Icons.payments_outlined,
                                          size: 18,
                                          color: appcolor.iconcolor,
                                        ),
                                        backgroundColor: Colors.green[50],
                                      ),
                                      Chip(
                                        label: Text(
                                          order["orders_status"] == 4
                                              ? "Archiv"
                                              : "Pending Approval",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                        avatar: Icon(
                                          Icons.verified,
                                          size: 18,
                                          color: appcolor.iconcolor,
                                        ),
                                        backgroundColor: Colors.blue[50],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        order["orders_coupon"] > 0
                                            ? "Price After coupon: \$ ${order["orders_price"]}"
                                            : "Order Price: \$ ${order["orders_price"]}",
                                        style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      ...(order["orders_Rating"] == 0
                                          ? [
                                            InkWell(
                                              onTap: () {
                                                int selectedRating = 0;
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder:
                                                      (
                                                        BuildContext cont,
                                                      ) => SlideRatingDialog(
                                                        buttonTitle: "Send",
                                                        buttonColor:
                                                            Colors.amberAccent,

                                                        onRatingChanged: (
                                                          rating,
                                                        ) {
                                                          selectedRating =
                                                              rating;
                                                          print(
                                                            "User Rating: $rating",
                                                          );
                                                        },

                                                        buttonOnTap: () {
                                                          if (selectedRating !=
                                                              0) {
                                                            controller.Rating(
                                                              order["orders_id"],
                                                              selectedRating,
                                                            );
                                                            Navigator.of(
                                                              context,
                                                            ).pop();
                                                          } else {
                                                            Get.snackbar(
                                                              "warning",
                                                              "I was not notified of the evaluation.",
                                                            );
                                                          }
                                                        },
                                                      ),
                                                );
                                              },
                                              child: Center(
                                                child: Icon(
                                                  Icons.star_border_outlined,
                                                  size: 30,
                                                  color: appcolor.iconcolor,
                                                ),
                                              ),
                                            ),
                                          ]
                                          : [
                                            Center(
                                              child: Icon(
                                                Icons.star,
                                                size: 30,
                                                color: appcolor.iconcolor,
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                  Text(
                                    "Delivery Price: \$ ${order["orders_price_delivery"]}",
                                    style: TextStyle(
                                      fontSize: width * 0.045,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total: \$ ${order["orders_price"] + order["orders_price_delivery"]}",
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: appcolor.appbarcolor,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              int orderid = order["orders_id"];
                                              Get.toNamed(
                                                "/orderdetail",
                                                arguments: {
                                                  "ordersid": orderid,
                                                  "totalprice":
                                                      order["orders_price"] +
                                                      order["orders_price_delivery"],
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: height * 0.055,
                                              width: width * 0.32,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  colors: [
                                                    Color.fromARGB(
                                                      255,
                                                      161,
                                                      124,
                                                      0,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      199,
                                                      158,
                                                      25,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      185,
                                                      146,
                                                      16,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      186,
                                                      159,
                                                      70,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Details",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                        fontSize:
                                                            height * 0.022,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
