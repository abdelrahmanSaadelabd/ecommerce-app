import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/homecontroller/home_controller.dart';
import 'package:untitled1/view/widget/home//backgroundhome.dart';
import 'package:untitled1/view/widget/home//homecontent.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return Column(
          children: [
            Expanded(flex: 1, child: Backgroundhome()),

            Expanded(
              flex: 4,
              child: GetBuilder<HomeController>(
                builder:
                    (controller) => HandlingDataView(
                      statusRequst: controller.statusRequst,
                      widget: SingleChildScrollView(
                        child: Column(
                          children: [
                            HomeViewcontent(height: height, width: width),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
