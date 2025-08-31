import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ForgetpasswordLoginText extends StatelessWidget {
  const ForgetpasswordLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Get.toNamed("/forgetpassord_page");
        },
        child: Text(
          "Forget Password?",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15),
        ),
      ),
    );
  }
}
