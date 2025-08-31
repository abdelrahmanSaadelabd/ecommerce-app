import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/checkoutcontroller.dart';
import 'package:untitled1/controller/address/address_controller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';

class Addressshopping extends StatelessWidget {
  const Addressshopping({super.key, this.he, this.we});

  final he;

  final we;
  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    Checkoutcontroller controllercheckout = Get.find();

    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (controller) {
        return HandlingDataView(
          statusRequst: controller.statusRequst,
          widget:
              controller.address.isNotEmpty
                  ? ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: controller.address.length,
                    itemBuilder: (context, i) {
                      var id = controller.address[i]["address_id"];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              controllercheckout.addressid == id.toString()
                                  ? 0
                                  : 35,
                        ),
                        child: InkWell(
                          onTap: () {
                            controllercheckout.chooseaddress(id.toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Card(
                              color:
                                  controllercheckout.addressid == id.toString()
                                      ? appcolor.appbarcolor
                                      : const Color.fromARGB(
                                        255,
                                        247,
                                        246,
                                        237,
                                      ),
                              child: Center(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.location_on_outlined,
                                    color:
                                        controllercheckout.addressid ==
                                                id.toString()
                                            ? Colors.white
                                            : appcolor.iconcolor,
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.address[i]["address_name"]}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color:
                                              controllercheckout.addressid ==
                                                      id.toString()
                                                  ? Colors.white
                                                  : appcolor.iconcolor,
                                        ),
                                      ),
                                      Text(
                                        "${controller.address[i]["address_city"]}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              controllercheckout.addressid ==
                                                      id.toString()
                                                  ? Colors.white
                                                  : appcolor.iconcolor,
                                        ),
                                      ),
                                      Text(
                                        "${controller.address[i]["address_street"]}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              controllercheckout.addressid ==
                                                      id.toString()
                                                  ? Colors.white
                                                  : appcolor.iconcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  : Text(
                    "Select the address you want the order to reach from the site in the settings.",
                    style: TextStyle(fontSize: 30),
                  ),
        );
      },
    );
  }
}
