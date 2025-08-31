import 'package:adminapp/controller/core/constant/colors.dart';
import 'package:adminapp/controller/core/constant/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Block extends StatelessWidget {
  const Block({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    List<String> images = [APPimage.user, APPimage.deluvers];
    List<String> namepage = ["/usersblock", "/deliverysblock"];
    List<String> imageNames = ["Users", "delivers"];

    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Blocks",
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
                    crossAxisCount: (width / 140).floor().clamp(2, 5),
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
        );
      },
    );
  }
}
