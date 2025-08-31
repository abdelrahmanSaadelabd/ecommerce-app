import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:untitled1/controller/homecontroller/home_screen_controller.dart';
import 'package:untitled1/view/widget/home/customNacbootoombar.dart';

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

              shape: CircularNotchedRectangle(),
              notchMargin: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(controller.pageslist.length, (index) {
                    int i = index > 2 ? index - 1 : index;
                    if (index == 2) {
                      return Spacer();
                    }

                    return Flexible(
                      child: Customnacbootoombar(
                        active: controller.currentpage == i,
                        icon: controller.iconpages[i],
                        onPressed: () {
                          controller.changpages(i);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
    );
  }
}
