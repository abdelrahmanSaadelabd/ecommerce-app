import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/deliverycontroller/deliveryeidetusercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Edeitdelivery extends StatelessWidget {
  const Edeitdelivery({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.appbarcolor,
        elevation: 0,
        title: Text(
          "Ediet Delivery",
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
              child: GetBuilder<Deliveryeidetdeliverycontroller>(
                init: Deliveryeidetdeliverycontroller(),
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
                              _buildInputFields(
                                appcolor.iconcolor,

                                controller.email,
                                controller.name,
                                controller.passswrod,
                                controller.phone,
                              ),

                              const SizedBox(height: 15),
                              _buildSubmitButton(
                                constraints.maxWidth,
                                constraints.maxHeight,
                                () {
                                  controller.eidetdelivery();
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

  Widget _buildInputFields(
    color,

    emailcontroler,
    namecontroler,
    passwordcontroler,
    phonecontroler,
  ) {
    return Column(
      children: [
        CustomTextField(
          controller: emailcontroler,
          label: "Email",
          obscureText: false,
        ),
        CustomTextField(
          obscureText: false,
          controller: namecontroler,
          label: "Name".tr,
          maxLines: 1,
        ),
        CustomTextField(
          obscureText: true,
          controller: passwordcontroler,
          label: "Password".tr,
          maxLines: 1,
        ),
        CustomTextField(
          obscureText: false,

          controller: phonecontroler,
          label: "phone".tr,
          maxLines: 1,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(double width, double height, ontao) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: ontao,
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

  final bool obscureText;
  final int maxLines;
  final color;
  final void Function()? ontap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.color,
    this.ontap,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: obscureText,
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
