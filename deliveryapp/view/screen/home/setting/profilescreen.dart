import 'package:deliveryapp/controller/core/constant/colors.dart';

import 'package:deliveryapp/controller/login/logincontroller.dart';
import 'package:deliveryapp/linkapi/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});
  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        final cardColor = Colors.white.withOpacity(0.97);
        final shadow = [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ];

        return Scaffold(
          backgroundColor: appcolor.appbarcolor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: appcolor.iconcolor,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: GetBuilder<Logincontroller>(
            builder:
                (controller) => Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [appcolor.appbarcolor, Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: height * 0.16),
                        height: height,
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(width * 0.15),
                          ),
                          boxShadow: shadow,
                        ),
                        width: width,
                        child: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.18),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  _profileInfoCard(
                                    label: "Email:",
                                    value:
                                        "${controller.myServices.sharedPreferences.getString("email")}",
                                    icon: Icons.email_outlined,
                                    color: appcolor.iconcolor,
                                    width: width,
                                  ),
                                  _profileInfoCard(
                                    label: "Name:",
                                    value:
                                        "${controller.myServices.sharedPreferences.getString("deliveryname")}",
                                    icon: Icons.person_outline_outlined,
                                    color: appcolor.iconcolor,
                                    width: width,
                                  ),
                                  _profileInfoCard(
                                    label: "Phone:",
                                    value:
                                        "${controller.myServices.sharedPreferences.getString("phone")}",
                                    icon: Icons.phone_enabled_outlined,
                                    color: appcolor.iconcolor,
                                    width: width,
                                  ),
                                  _profileInfoCard(
                                    label: "Address:",
                                    value:
                                        "${controller.myServices.sharedPreferences.getString("email")}",
                                    icon: Icons.location_on_outlined,
                                    color: appcolor.iconcolor,
                                    width: width,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.04,
                      left: width * 0.5 - (width * 0.19),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: width * 0.19,
                          backgroundImage: NetworkImage(
                            "${appLink.imagenprofile}/${controller.myServices.sharedPreferences.getString("deliveryimage")}",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.17,
                      right: width * 0.1,
                      child: IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 38,
                            color: appcolor.iconcolor,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      top: height * 0.17,
                      left: width * 0.1,
                      child: IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.share_sharp,
                            size: 38,
                            color: appcolor.iconcolor,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
          ),
        );
      },
    );
  }
}

Widget _profileInfoCard({
  required String label,
  required String value,
  required IconData icon,
  required Color color,
  required double width,
}) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    color: const Color.fromARGB(255, 247, 246, 237),
    elevation: 2,
    shadowColor: color,
    child: ListTile(
      leading: Text(
        label,
        style: TextStyle(color: Colors.grey[400], fontSize: width * 0.055),
      ),
      title: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontSize: width * 0.055),
      ),
      trailing: Icon(icon, size: 30, color: color),
    ),
  );
}
