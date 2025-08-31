import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Textdatahome extends StatelessWidget {
  const Textdatahome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          "Ecommerce",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        Text(
          "Don’t just want it.Click it. Own it.",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
