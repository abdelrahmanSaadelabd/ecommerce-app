import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/productcontroller.dart';
import 'package:untitled1/view/widget/product/colorandcount.dart';
import 'package:untitled1/view/widget/product/imageproduct.dart';
import 'package:untitled1/view/widget/product/nameandprice.dart';

class Productdit extends StatelessWidget {
  final double height;
  final double width;
  const Productdit({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    Productcontroller controller = Get.find<Productcontroller>();

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(255, 255, 245, 226),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 10,
              offset: Offset(3, 3),
              blurRadius: 10,
            ),
          ],
        ),

        width: width * 0.9,
        height: height * 0.47,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Imageproduct(height: height, width: width),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 3),
                width: 70,
                height: 10,

                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.product.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      margin: EdgeInsets.only(right: 5),
                      duration: Duration(milliseconds: 600),
                      width: controller.currentpage == index ? 25 : 7,
                      height: 6,

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(194, 255, 207, 65),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  },
                ),
              ),
            ),
            Flexible(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Nameandprice(height: height, width: width),
                    Colorandcount(height: height, width: width),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
