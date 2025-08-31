import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:untitled1/controller/address/address_controller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/constant/image.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());

    appColor appcolor = Get.put(appColor());

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: appcolor.appbarcolor,
            elevation: 0,
          ),
          body: GetBuilder<AddressController>(
            builder:
                (controller) => HandlingDataView(
                  statusRequst: controller.statusRequst,
                  widget: Stack(
                    children: [
                      Container(
                        height: height,
                        width: height,
                        decoration: BoxDecoration(color: appcolor.appbarcolor),
                        child: Container(
                          margin: EdgeInsets.only(top: height * 0.12),
                          height: height,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(width * 0.15),
                            ),
                          ),
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.20),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Card(
                                          shadowColor: appcolor.appbarcolor,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 6,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            247,
                                            246,
                                            237,
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              leading: Text(
                                                "Email:",
                                                style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 25,
                                                ),
                                              ),

                                              title: Text(
                                                "abdo.saad.abd@gmail.com",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                ),
                                              ),
                                              trailing: Icon(
                                                size: 30,

                                                Icons.email_outlined,
                                                color: appcolor.iconcolor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        child: Card(
                                          shadowColor: appcolor.appbarcolor,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 6,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            247,
                                            246,
                                            237,
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              leading: Text(
                                                "Name:",
                                                style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 25,
                                                ),
                                              ),

                                              title: Text(
                                                "abdo12",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                ),
                                              ),
                                              trailing: Icon(
                                                size: 30,

                                                Icons.person_outline_outlined,
                                                color: appcolor.iconcolor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        child: Card(
                                          shadowColor: appcolor.appbarcolor,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 6,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            247,
                                            246,
                                            237,
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              leading: Text(
                                                "Phone:",
                                                style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 25,
                                                ),
                                              ),

                                              title: Text(
                                                "0121512854",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                ),
                                              ),
                                              trailing: Icon(
                                                size: 30,

                                                Icons.phone_enabled_outlined,
                                                color: appcolor.iconcolor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        child: Card(
                                          shadowColor: appcolor.appbarcolor,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 6,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            247,
                                            246,
                                            237,
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              leading: Text(
                                                "Adders:",
                                                style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 25,
                                                ),
                                              ),
                                              title: Text(
                                                "${controller.namecity}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                ),
                                              ),

                                              trailing: Icon(
                                                size: 30,

                                                Icons.location_on_outlined,
                                                color: appcolor.iconcolor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.02,
                        left: width * 0.5 - (width * 0.23),
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: width * 0.23,
                          backgroundImage: AssetImage(APPimage.prodect1),
                        ),
                      ),

                      Positioned(
                        top: height * 0.13,
                        right: width * 0.1,
                        child: IconButton(
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 45,
                              color: appcolor.iconcolor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        top: height * 0.13,
                        left: width * 0.1,
                        child: IconButton(
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: Icon(
                              Icons.share_sharp,
                              size: 45,
                              color: appcolor.iconcolor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }
}
