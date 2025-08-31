import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/homecontroller/scearchhomecontroller.dart';
import 'package:untitled1/view/widget/Scearch/descScearch.dart';
import 'package:untitled1/view/widget/Scearch/imagepartscearch.dart';

class Scearchhome extends StatelessWidget {
  const Scearchhome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GetBuilder<Scearchhomecontroller>(
          init: Scearchhomecontroller(),
          builder:
              (controller) => Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        controller.changestatusScearch("");
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 50,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  HandlingDataView(
                    statusRequst: controller.statusRequst,
                    widget: ListView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),

                      itemCount: controller.product.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            controller.gotoproduct(
                              controller.product,
                              i,
                              controller.product[i]["items_id"].toString(),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
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
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Imagepartscearch(i: i),
                                SizedBox(width: 15),
                                Descscearch(i: i),
                                Icon(
                                  Icons.ads_click_rounded,
                                  size: 50,
                                  color: Colors.amber,
                                ),
                              ],
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
