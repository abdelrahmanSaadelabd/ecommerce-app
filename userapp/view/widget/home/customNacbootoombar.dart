import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:untitled1/controller/core/constant/colors.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: active == true ? appcolor.appbarcolor : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
