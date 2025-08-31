import 'package:adminapp/controller/catecontroller/catecontroller.dart';
import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/view/screen/home/cate/addcate.dart';
import 'package:adminapp/view/widget/cate/desc.dart';
import 'package:adminapp/view/widget/cate/imagepart.dart';
import 'package:adminapp/view/widget/cate/partcountanddaelet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});

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
              Get.to(Addcate());
            },
            child: Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255)),
            backgroundColor: appcolor.appbarcolor,
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Category",
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
            child: GetBuilder<Catecontroller>(
              init: Catecontroller(),
              builder:
                  (controller) => HandlingDataView(
                    statusRequst: controller.statusRequst,
                    widget: ListView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,

                      itemCount: controller.categroys.length,
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
                              Imagepart(i: i, controller: controller),
                              Descpart(i: i, controller: controller),
                              Partcountanddaelet(
                                i: i,
                                controller: controller,
                                controllernamecate:
                                    controller.categroys[i]['categories_name'],
                                controllercategroyid:
                                    controller.categroys[i]['categories_id'],
                                oldimage:
                                    controller.categroys[i]['categories_image'],
                                onTap: () {
                                  controller.delet(
                                    controller.categroys[i]['categories_id'],
                                    controller.categroys[i]['categories_image'],
                                  );
                                },
                              ),
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
