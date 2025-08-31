import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/notification/notificationcontroller.dart';
import 'package:adminapp/view/widget/notification/popup_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jiffy/jiffy.dart';

class Notificationscreen extends StatelessWidget {
  const Notificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        appColor appcolor = Get.put(appColor());

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => PopupNotification());
            },
            child: Icon(
              Icons.add_alert_outlined,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            backgroundColor: appcolor.appbarcolor,
          ),
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: appcolor.appbarcolor,
            title: Text(
              "notification",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [appcolor.appbarcolor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GetBuilder<Notificationcontroller>(
                init: Notificationcontroller(),
                builder: (controller) {
                  List notification = [...controller.data];
                  notification.sort(
                    (a, b) => b["notification_date"].compareTo(
                      a["notification_date"],
                    ),
                  );
                  return ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: notification.length,
                    itemBuilder: (context, i) {
                      return HandlingDataView(
                        statusRequst: controller.statusRequst,
                        widget: Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  215,
                                  86,
                                ).withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(5, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.notifications_active_outlined,
                                      color: appcolor.iconcolor,
                                    ),
                                    Text(
                                      "${notification[i]["notification_title"]}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: appcolor.appbarcolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      Jiffy.parse(
                                        notification[i]["notification_date"],
                                      ).fromNow(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: const Color.fromARGB(
                                          255,
                                          224,
                                          212,
                                          169,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${notification[i]["notification_body"]}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          // Card(
                          //   color: const Color.fromARGB(255, 247, 246, 237),
                          //   child: Center(
                          //     child: ListTile(
                          //       leading: Icon(
                          //         Icons.location_on_outlined,
                          //         color: appcolor.appbarcolor,
                          //       ),
                          //       title: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             "${notification[i]["notification_title"]}",
                          //             style: TextStyle(fontSize: 30),
                          //           ),
                          //           Text(
                          //             "${notification[i]["notification_body"]}",
                          //             style: TextStyle(fontSize: 20),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
