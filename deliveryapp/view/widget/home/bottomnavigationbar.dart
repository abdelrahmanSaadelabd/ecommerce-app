import 'package:deliveryapp/controller/homecontroller/home_screen_controller.dart';
import 'package:deliveryapp/view/widget/home/customNacbootoombar.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class Bottomnavigationbar extends StatelessWidget {
  const Bottomnavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder:
          (controller) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, -4),
                  blurRadius: 15,
                ),
              ],
            ),
            child: BottomAppBar(
              height: 60,
              elevation: 0,
              color: const Color.fromARGB(255, 249, 249, 249),

              notchMargin: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(controller.pageslist.length, (index) {
                    int i = index;

                    return Customnacbootoombar(
                      active: controller.currentpage == i,
                      icon: controller.iconpages[i],
                      onPressed: () {
                        controller.changpages(i);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
    );
  }
}
