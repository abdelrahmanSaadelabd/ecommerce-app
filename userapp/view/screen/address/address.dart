import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:untitled1/controller/address/address_controller.dart';
import 'package:untitled1/controller/address/eidetaddresscontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/view/widget/address/eidetaddress.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings", style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: appcolor.appbarcolor,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appcolor.iconcolor,
        shape: CircleBorder(),
        onPressed: () {
          Get.toNamed('/address_add');
        },
        child: FaIcon(
          Icons.location_on_outlined,
          size: 35,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GetBuilder<AddressController>(
            init: AddressController(),
            builder: (controller) {
              return HandlingDataView(
                statusRequst: controller.statusRequst,
                widget: ListView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemCount: controller.address.length,
                  itemBuilder: (context, i) {
                    var id = controller.address[i]["address_id"];
                    return InkWell(
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
                        child: Card(
                          color: const Color.fromARGB(255, 247, 246, 237),
                          child: Center(
                            child: ListTile(
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: appcolor.appbarcolor,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.address[i]["address_name"]}",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    "${controller.address[i]["address_city"]}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "${controller.address[i]["address_street"]}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (id != null) {
                                        controller.deletData(id);
                                      } else {
                                        print(
                                          "❌ addressid is null at index $i",
                                        );
                                        Get.snackbar(
                                          "Error",
                                          "Address ID is missing, cannot delete.",
                                        );
                                      }
                                    },
                                    child: Icon(
                                      Icons.delete_outline_outlined,
                                      color: appcolor.iconcolor,
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      final editController = Get.put(
                                        Editaddresscontroller(),
                                      );
                                      editController.nameaddres.text =
                                          controller.address[i]["address_name"];
                                      editController.cityddres.text =
                                          controller.address[i]["address_city"];
                                      editController.streetaddres.text =
                                          controller
                                              .address[i]["address_street"];

                                      showDialog(
                                        context: context,
                                        builder:
                                            (_) => Eidetaddresspopup(
                                              idaddress: id,
                                              controllername:
                                                  editController.nameaddres,
                                              controllercity:
                                                  editController.cityddres,
                                              controllerstreet:
                                                  editController.streetaddres,
                                            ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: appcolor.iconcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
    );
  }
}
