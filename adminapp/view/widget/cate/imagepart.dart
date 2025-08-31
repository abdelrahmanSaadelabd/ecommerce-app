import 'package:adminapp/linkapi/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Imagepart extends StatelessWidget {
  final i;
  final controller;
  const Imagepart({super.key, this.i, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SvgPicture.network(
          height: 50,
          width: 50,
          "${appLink.imagencategries}/${controller.categroys[i]["categories_image"]}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
