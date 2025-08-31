import 'package:adminapp/controller/catecontroller/catecontroller.dart';
import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/item/additemcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Additem extends StatelessWidget {
  const Additem({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.appbarcolor,
        elevation: 0,
        title: Text(
          "Add Items",
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
              child: GetBuilder<Additemcontroller>(
                init: Additemcontroller(),
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
                              _buildImagePicker(controller),
                              const SizedBox(height: 20),
                              _buildInputFields(appcolor.iconcolor, controller),
                              _buildActiveSwitch(
                                appcolor.iconcolor,
                                controller,
                              ),
                              const SizedBox(height: 15),
                              _buildSubmitButton(
                                constraints.maxWidth,
                                constraints.maxHeight,
                                controller,
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

  Widget _buildImagePicker(controller) {
    return InkWell(
      onTap: () {
        controller.chengimage();
      },
      child: Column(
        children: [
          Center(
            child:
                controller.file != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.file(
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
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              controller.chengmoreimage();
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.additionalImages.length + 1,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child:
                          controller.additionalImages.length > index
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.file(
                                  controller.additionalImages[index],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              )
                              : Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 50,
                                color: const Color.fromARGB(255, 255, 235, 173),
                              ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveSwitch(color, controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Item is Active",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: controller.active,
          activeColor: color,
          hoverColor: color,
          focusColor: color,
          inactiveThumbColor: color,
          inactiveTrackColor: const Color.fromARGB(82, 255, 214, 64),

          onChanged: (value) {
            controller.changstatusitems(value);
          },
        ),
      ],
    );
  }

  Widget _buildInputFields(color, controller) {
    return Column(
      children: [
        CustomTextField(
          controller: controller.nameitems,
          label: "Items name".tr,
        ),
        CustomTextField(
          controller: controller.priceitems,
          label: "price".tr,
          maxLines: 1,
        ),
        CustomTextField(
          controller: controller.discountitems,
          label: "Discount".tr,
          maxLines: 1,
        ),
        CustomTextField(
          controller: controller.countitems,
          label: "Count".tr,
          maxLines: 1,
        ),

        CustomTextField(
          controller: controller.cateitems,
          label: "Categories".tr,

          ontap: () {
            showModalBottomSheet(
              context: Get.context!,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Select Category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.categroys.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, index) {
                          final category = controller.categroys[index];
                          return InkWell(
                            onTap: () {
                              controller.setSelectedCategory(
                                category,
                              ); // 🟢 حفظ الاختيار
                              Get.back(); // غلق الـ bottom sheet
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 235, 173),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.brown.shade200,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  category["categories_name"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.brown.shade800,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),

        CustomTextField(
          controller: controller.descitems,
          label: "Description".tr,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(double width, double height, controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            controller.additems();
          },
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

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final color;
  final void Function()? ontap;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.color,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        onTap: ontap,

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
