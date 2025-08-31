import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<bool> alertexitapp(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeught = MediaQuery.of(context).size.height;
  Get.defaultDialog(
    title: "Warning",
    content: Text("Do you want to exit the app?"),
    cancel: GestureDetector(
      onTap: () {
        Get.back(); // لإغلاق الديلوج
      },
      child: Container(
        height: screenHeught * 0.05,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 255, 196, 0),
              Color.fromARGB(255, 254, 203, 36),
              Color.fromRGBO(255, 210, 60, 1),
              Color.fromARGB(255, 255, 209, 58),
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Cancel",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    confirm: GestureDetector(
      onTap: () {
        SystemNavigator.pop();
      },
      child: Container(
        height: screenHeught * 0.05,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 255, 0, 0),
              Color.fromARGB(255, 254, 36, 36),
              Color.fromRGBO(255, 60, 60, 1),
              Color.fromARGB(255, 255, 58, 58),
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Exit",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
  return Future.value(true);
}
