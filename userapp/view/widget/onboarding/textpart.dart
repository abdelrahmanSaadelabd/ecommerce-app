import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildTextSection(data, bool isTopYellow, BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenheight = MediaQuery.of(context).size.height;

  return Padding(
    padding: EdgeInsets.only(
      top: screenheight * 0.13,
      left: isTopYellow ? screenWidth * 0.03 : screenWidth * 0.3,
      right: isTopYellow ? screenWidth * 0.2 : screenWidth * 0,
    ),
    child: Column(
      children: [
        Text(data.title ?? '', style: Theme.of(context).textTheme.titleLarge),

        Text(
          data.body ?? '',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.04),
        ),
      ],
    ),
  );
}
