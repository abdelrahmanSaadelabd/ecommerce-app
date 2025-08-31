import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/functions/handling_data_view.dart';
import 'package:adminapp/controller/user/usercontroller.dart';
import 'package:adminapp/linkapi/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends StatelessWidget {
  const Users({super.key});

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
              "Users",
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
            child: GetBuilder<Usercontroller>(
              init: Usercontroller(),
              builder:
                  (controller) => HandlingDataView(
                    statusRequst: controller.statusRequst,
                    widget: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
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
                                "${appLink.imagenprofile}/${user['user_image']}",
                              ),
                            ),

                            title: Text(
                              maxLines: 1,
                              user['user_name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appcolor.iconcolor,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              maxLines: 1,
                              user['user_email'],
                              style: TextStyle(
                                color: appcolor.appbarcolor,
                                fontSize: 15,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: appcolor.iconcolor,
                                  ),
                                  onPressed: () {
                                    String userid = user['user_id'].toString();
                                    String name = user['user_name'].toString();
                                    String email =
                                        user['user_email'].toString();
                                    String password =
                                        user['user_password'].toString();
                                    String phone =
                                        user['user_phone'].toString();
                                    controller.gotoeidet(
                                      userid,
                                      name,
                                      email,
                                      password,
                                      phone,
                                    );
                                  },
                                ),

                                IconButton(
                                  icon: Icon(
                                    user['user_block'] == 0
                                        ? Icons.block
                                        : Icons.delete_sweep_outlined,
                                    color:
                                        user['user_block'] == 0
                                            ? appcolor.iconcolor
                                            : Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    user['user_block'] == 0
                                        ? controller.block(user['user_id'])
                                        : Get.defaultDialog(
                                          backgroundColor: const Color.fromARGB(
                                            255,
                                            255,
                                            236,
                                            178,
                                          ),
                                          title: "Warning",
                                          content: Text(
                                            "Do you want to exit the app?",
                                          ),
                                          cancel: GestureDetector(
                                            onTap: () {
                                              Get.back(); // لإغلاق الديلوج
                                            },
                                            child: Container(
                                              height: height * 0.05,
                                              width: width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  colors: [
                                                    Color.fromARGB(
                                                      255,
                                                      255,
                                                      196,
                                                      0,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      254,
                                                      203,
                                                      36,
                                                    ),
                                                    Color.fromRGBO(
                                                      255,
                                                      210,
                                                      60,
                                                      1,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      255,
                                                      209,
                                                      58,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Cancel",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          confirm: GestureDetector(
                                            onTap: () {
                                              controller.delet(user['user_id']);
                                              Get.back();
                                            },
                                            child: Container(
                                              height: height * 0.05,
                                              width: width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  colors: [
                                                    Color.fromARGB(
                                                      255,
                                                      255,
                                                      0,
                                                      0,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      254,
                                                      36,
                                                      36,
                                                    ),
                                                    Color.fromRGBO(
                                                      255,
                                                      60,
                                                      60,
                                                      1,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      255,
                                                      58,
                                                      58,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Sure",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                    ;
                                  },
                                ),
                              ],
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
