import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/core/constant/colors.dart';

class Cartpayment extends StatelessWidget {
  final he;
  final we;
  final String textpayment;
  final bool Active;
  const Cartpayment({
    super.key,
    required this.textpayment,
    required this.Active,
    this.he,
    this.we,
  });

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    return ClipRRect(
      child: Padding(
        padding:
            Active
                ? EdgeInsets.symmetric(horizontal: we * .05)
                : EdgeInsets.symmetric(horizontal: we * .15),
        child: Card(
          margin: EdgeInsets.only(top: he * 0.01),
          color:
              Active
                  ? appcolor.appbarcolor
                  : Color.fromARGB(255, 247, 246, 237),
          child: Center(
            child: Text(
              textpayment,
              style: TextStyle(
                fontSize: 25,
                color: Active ? Colors.white : appcolor.iconcolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
