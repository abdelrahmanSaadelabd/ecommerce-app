import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/reportcontroller/reportcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Report",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: appcolor.iconcolor,
          ),
        ),
        backgroundColor: appcolor.appbarcolor,
        elevation: 0,
        toolbarHeight: height * 0.05,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [appcolor.appbarcolor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GetBuilder<Reportcontroller>(
          init: Reportcontroller(),
          builder:
              (controller) => HandlingDataView(
                statusRequst: controller.statusRequst,
                widget: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 0),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 18,
                        runSpacing: 15,
                        children: [
                          _buildStatCard(
                            "Number of users",
                            "${controller.report['usercount']}",
                            Icons.person,
                            Colors.blue,
                          ),
                          _buildStatCard(
                            "User Witing",
                            "${controller.report['userUnder_construction']}",
                            Icons.person,
                            const Color.fromARGB(255, 25, 111, 180),
                          ),
                          _buildStatCard(
                            "Total Orders",
                            "${controller.report['ordercount']}",
                            Icons.shopping_cart,
                            Colors.green,
                          ),
                          _buildStatCard(
                            "Under construction",
                            "${controller.report['Under_construction']}",
                            Icons.pending_actions,
                            Colors.orange,
                          ),
                          _buildStatCard(
                            "profits",
                            "\$${controller.report['totalprice']}",
                            Icons.attach_money,
                            Colors.purple,
                          ),
                          _buildStatCard(
                            "Available delivery",
                            "${controller.report['deliverycount']}",
                            Icons.delivery_dining,
                            Colors.red,
                          ),
                          _buildStatCard(
                            "Delivery witing approve",
                            "${controller.report['deliveryUnder_construction']}",
                            Icons.delivery_dining,
                            const Color.fromARGB(255, 133, 35, 28),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 246, 215),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
