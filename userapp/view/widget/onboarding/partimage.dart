// جزء الصورة - في الجزء الأبيض
import 'package:flutter/material.dart';

Widget buildImageSection(data) {
  return Center(
    child: Image.asset(
      data.image!,
      width: 350,
      height: 350,
      fit: BoxFit.contain,
    ),
  );
}
