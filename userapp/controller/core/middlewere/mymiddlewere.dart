import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/core/services/myservices.dart';

class Mymiddlewere extends GetMiddleware {
  @override
  int? get priority => 0;
  MyServices myServices = Get.find();
  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: "/home");
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: "/loginpage");
    }
  }
}
