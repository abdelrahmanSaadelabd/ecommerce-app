import 'package:deliveryapp/controller/core/constant/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Customnacbootoombar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final bool active;

  const Customnacbootoombar({
    super.key,
    required this.onPressed,
    required this.icon,

    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? appcolor.appbarcolor : Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
