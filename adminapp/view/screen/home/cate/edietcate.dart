import 'package:adminapp/controller/catecontroller/eidetcatecontroller.dart';
import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/linkapi/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Edietcate extends StatelessWidget {
  const Edietcate({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.appbarcolor,
        elevation: 0,
        title: Text(
          "Ediet Category",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: appcolor.iconcolor,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [appcolor.appbarcolor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: GetBuilder<Eidetcatecontroller>(
                init: Eidetcatecontroller(),
                builder:
                    (controller) => HandlingDataView(
                      statusRequst: controller.statusRequst,
                      widget: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: constraints.maxHeight * 0.02,
                            horizontal: constraints.maxWidth * 0.1,
                          ),
                          child: Column(
                            children: [
                              _buildImagePicker(controller, () {
                                controller.chengimage();
                              }),
                              const SizedBox(height: 20),
                              _buildInputFields(
                                appcolor.iconcolor,
                                controller.name,
                              ),

                              const SizedBox(height: 15),
                              _buildSubmitButton(
                                constraints.maxWidth,
                                constraints.maxHeight,
                                () {
                                  controller.eidetcate();
                                },
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
      ),
    );
  }

  Widget _buildImagePicker(controller, onTap) {
    return InkWell(
      onTap: onTap,
      child:
          controller.oldimage != null
              ? Center(
                child:
                    controller.file != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SvgPicture.file(
                            controller.file!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                        : Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 100,
                          color: const Color.fromARGB(255, 255, 235, 173),
                        ),
              )
              : Center(
                child:
                    controller.oldimage != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SvgPicture.network(
                            "${appLink.imagencategries}/${controller.oldimage}",
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                        : Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 100,
                          color: const Color.fromARGB(255, 255, 235, 173),
                        ),
              ),
    );
  }

  Widget _buildInputFields(colo, controller) {
    return Column(
      children: [
        CustomTextField(controller: controller, label: "Category name".tr),
      ],
    );
  }

  Widget _buildSubmitButton(double width, double height, ontap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: ontap,
          child: Container(
            height: height * 0.055,
            width: width * 0.32,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 161, 124, 0),
                  Color.fromARGB(255, 199, 158, 25),
                  Color.fromARGB(255, 185, 146, 16),
                  Color.fromARGB(255, 186, 159, 70),
                ],
              ),
            ),
            child: Center(
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ويدجت حقل الإدخال المخصص
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final color;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 235, 173),
          labelStyle: TextStyle(color: color, fontSize: 18),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
