import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/cartcontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/view/widget/cart/bottombarcard.dart';
import 'package:untitled1/view/widget/cart/desc.dart';
import 'package:untitled1/view/widget/cart/imagepart.dart';
import 'package:untitled1/view/widget/cart/partcountanddaelet.dart';
import 'package:untitled1/view/widget/cart/popup_coupop.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        appColor appcolor = Get.put(appColor());
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: appcolor.appbarcolor,
            shape: CircleBorder(),
            onPressed: () {
              showDialog(context: context, builder: (_) => PopupCoupop());
            },
            child: FaIcon(
              Icons.local_offer,
              size: 30,
              color: appcolor.iconcolor,
            ),
          ),
          bottomNavigationBar: GetBuilder<cartcontroller>(
            builder:
                (controller) => Bottombarcard(height: height, width: width),
          ),
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: appcolor.appbarcolor,
            title: Text(
              "cart",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: appcolor.iconcolor),
            ),
          ),
          body: SafeArea(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [appcolor.appbarcolor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GetBuilder<cartcontroller>(
                  init: cartcontroller(),
                  builder:
                      (controller) => HandlingDataView(
                        statusRequst: controller.statusRequst,
                        widget: ListView.builder(
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: controller.cart.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                controller.gotoproduct(
                                  i,
                                  controller.cart[i]["items_id"].toString(),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    245,
                                    226,
                                  ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Imagepart(i: i),
                                    Descpart(i: i),
                                    Partcountanddaelet(i: i),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
