import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';

import 'package:untitled1/controller/address/eidetaddresscontroller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/constant/image.dart';
import 'package:untitled1/view/widget/address/customdialogaddressname.dart';

class Eidetaddresspopup extends StatelessWidget {
  final TextEditingController? controllername;
  final TextEditingController? controllercity;
  final TextEditingController? controllerstreet;
  final idaddress;
  const Eidetaddresspopup({
    super.key,
    this.controllername,
    this.controllercity,
    this.controllerstreet,
    this.idaddress,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Editaddresscontroller>(
      builder:
          (controller) =>
              controller.statusRequst == StatusRequst.loading
                  ? Center(
                    child: LottieBuilder.asset(
                      APPimage.sendcode,
                      height: 500,
                      width: 500,
                    ),
                  )
                  : Customdialogaddressname(
                    content: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              "Eidet you address",
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 128, 128, 128),
                              ),
                            ),
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: controllername,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  filled: true,
                                  focusColor: Colors.amberAccent,
                                  fillColor: const Color.fromARGB(
                                    255,
                                    255,
                                    247,
                                    215,
                                  ),
                                  hoverColor: Colors.amberAccent,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.all(10),

                              child: TextFormField(
                                controller: controllercity,
                                decoration: InputDecoration(
                                  hintText: "City",
                                  filled: true,
                                  focusColor: Colors.amberAccent,
                                  fillColor: const Color.fromARGB(
                                    255,
                                    255,
                                    247,
                                    215,
                                  ),
                                  hoverColor: Colors.amberAccent,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.all(10),

                              child: TextFormField(
                                controller: controllerstreet,
                                decoration: InputDecoration(
                                  hintText: "Street",
                                  filled: true,
                                  focusColor: Colors.amberAccent,
                                  fillColor: const Color.fromARGB(
                                    255,
                                    255,
                                    247,
                                    215,
                                  ),
                                  hoverColor: Colors.amberAccent,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      controller.postData(idaddress);
                      Get.back();
                    },

                    dilogiconcolor: Color.fromARGB(255, 255, 196, 0),
                    titledilog: "Eidet Address!",
                    fontsize: 25,
                    Colortitle: const Color.fromARGB(255, 129, 99, 1),
                    namebottomdilog1: "Send",
                  ),
    );
  }
}
