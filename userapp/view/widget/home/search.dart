import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/core/constant/colors.dart';

class Search extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onscearch;

  const Search({
    super.key,
    required this.height,
    required this.width,
    this.onChanged,
    this.onscearch,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onTap: onscearch,

        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 245, 226),
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 20,
            color: const Color.fromARGB(255, 126, 126, 126),
          ),
          prefixIcon: InkWell(
            onTap: onTap,
            child: Icon(Icons.search, size: 30, color: appcolor.iconcolor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
