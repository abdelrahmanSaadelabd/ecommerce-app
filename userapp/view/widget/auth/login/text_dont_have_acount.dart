import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TextDontHaveAcount extends StatelessWidget {
  const TextDontHaveAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have account?"),
        TextButton(
          onPressed: () {
            Get.toNamed("/singup_page");
          },
          child: Text(
            "Sing UP",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 196, 2),
            ),
          ),
        ),
      ],
    );
  }
}
