import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/item/itemscontroller.dart';
import 'package:adminapp/view/screen/home/itmes/additem.dart';
import 'package:adminapp/view/widget/items/eidet%5Edaelet.dart';
import 'package:adminapp/view/widget/items/descitem.dart';
import 'package:adminapp/view/widget/items/imagepartitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(Additem());
            },
            child: Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255)),
            backgroundColor: appcolor.appbarcolor,
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              " Items",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: appcolor.iconcolor,
              ),
            ),
            backgroundColor: appcolor.appbarcolor,
            elevation: 0,
          ),
          body: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [appcolor.appbarcolor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: GetBuilder<itemscontroller>(
              init: itemscontroller(),
              builder:
                  (controller) => HandlingDataView(
                    statusRequst: controller.statusRequst,
                    widget: ListView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,

                      itemCount: controller.items.length,
                      itemBuilder: (context, i) {
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
                              Imagepartitems(i: i, controller: controller),
                              Descitem(i: i, controller: controller),
                              Eidetdaelet(i: i, controller: controller),
                            ],
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
