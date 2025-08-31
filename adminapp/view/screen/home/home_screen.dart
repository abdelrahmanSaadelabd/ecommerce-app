import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/constant/image.dart';
import 'package:adminapp/controller/core/functions/alert_exit_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    List<String> images = [
      APPimage.user,
      APPimage.deluvers,
      APPimage.notification,

      APPimage.items,
      APPimage.cate,
      APPimage.order,
      APPimage.report,
      APPimage.block,
      APPimage.setting,
    ];
    List<String> namepage = [
      "/Users",
      "/delivers",
      "/Notifications",

      "/items",
      "/Category",
      "/Orderscreen",
      "/Report",
      "/block",
      "/SettingsScreen",
    ];
    List<String> imageNames = [
      "Users",
      "Delivers",
      "Notifications",

      "Itmes",
      "Categorys",
      "Orders",
      "Reports",
      " Blocks",
      "Settings",
    ];

    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return WillPopScope(
          onWillPop: () => alertexitapp(context),
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Home",
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
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 40,
                  ),
                  child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (width / 130).floor().clamp(
                        2,
                        5,
                      ), // responsive
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder:
                        (context, index) => InkWell(
                          onTap: () {
                            Get.toNamed(namepage[index]);
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 255, 246, 215),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: Image.asset(
                                    images[index],
                                    width: width * 0.2,
                                    height: height * 0.1,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  imageNames[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: appcolor.iconcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
