import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/notification/pushnatification.dart';
import 'package:adminapp/view/widget/notification/customdialognotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class PopupNotification extends StatelessWidget {
  const PopupNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Pushnatificationcontroller>(
      init: Pushnatificationcontroller(),
      builder:
          (controller) => HandlingDataView(
            statusRequst: controller.statusRequst,
            widget: Customdialognotification(
              content: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Send Notification",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 128, 128, 128),
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        hintText: "Email user",
                        filled: true,
                        focusColor: Colors.amberAccent,
                        fillColor: const Color.fromARGB(255, 255, 247, 215),
                        hoverColor: Colors.amberAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    TextFormField(
                      controller: controller.title,
                      decoration: InputDecoration(
                        hintText: "Title",
                        filled: true,
                        focusColor: Colors.amberAccent,
                        fillColor: const Color.fromARGB(255, 255, 247, 215),
                        hoverColor: Colors.amberAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    TextFormField(
                      controller: controller.body,
                      decoration: InputDecoration(
                        hintText: "Message",
                        filled: true,
                        focusColor: Colors.amberAccent,
                        fillColor: const Color.fromARGB(255, 255, 247, 215),
                        hoverColor: Colors.amberAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () async {
                controller.pushnatification();
                Get.back();
              },

              dilogiconcolor: Color.fromARGB(255, 255, 196, 0),
              titledilog: "Push Notification",
              fontsize: 25,
              Colortitle: const Color.fromARGB(255, 129, 99, 1),
              contentdilog: "Enter the special code sent",
              namebottomdilog1: "Send",
            ),
          ),
    );
  }
}
