import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/deliverycontroller/deliveryblockcontroller.dart';
import 'package:adminapp/linkapi/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class deliveryblock extends StatelessWidget {
  const deliveryblock({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    final mediaQuery = MediaQuery.of(context);

    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "deliverys",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: appcolor.iconcolor,
              ),
            ),
            backgroundColor: appcolor.appbarcolor,
            elevation: 0,
          ),
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
            child: GetBuilder<deliveryblockcontroller>(
              init: deliveryblockcontroller(),
              builder:
                  (controller) => HandlingDataView(
                    statusRequst: controller.statusRequst,
                    widget: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: controller.deliverys.length,
                      itemBuilder: (context, index) {
                        final delivery = controller.deliverys[index];
                        return Card(
                          color: const Color.fromARGB(255, 255, 245, 226),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                "${appLink.imagenprofile}/${delivery['delivery_image']}",
                              ),
                            ),

                            title: Text(
                              maxLines: 1,
                              delivery['delivery_name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appcolor.iconcolor,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              maxLines: 1,
                              delivery['delivery_email'],
                              style: TextStyle(
                                color: appcolor.appbarcolor,
                                fontSize: 15,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.lock_open,

                                color: appcolor.iconcolor,
                              ),
                              onPressed: () {
                                controller.unblock(delivery['delivery_id']);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
