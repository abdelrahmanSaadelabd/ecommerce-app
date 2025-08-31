import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/core/constant/colors.dart';

class Choosedeliverytyp extends StatelessWidget {
  final height;
  final width;
  final String textdelivery;
  final String image;
  final bool Active;
  const Choosedeliverytyp({
    super.key,
    this.height,
    this.width,
    required this.textdelivery,
    required this.Active,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return Container(
      height: height * .15,
      width: width * 0.35,

      decoration: BoxDecoration(
        color:
            Active
                ? appcolor.appbarcolor
                : const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: appcolor.appbarcolor, width: 5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              image,
              width: width * 0.2,
              color: Active ? Colors.white : null,
            ),
          ),

          Flexible(
            child: Text(
              maxLines: 1,
              textdelivery,
              style: TextStyle(
                color:
                    Active
                        ? Colors.white
                        : const Color.fromARGB(255, 236, 177, 0),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
