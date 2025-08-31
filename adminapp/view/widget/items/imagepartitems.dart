import 'package:adminapp/linkapi/link_api.dart';
import 'package:flutter/widgets.dart';

class Imagepartitems extends StatelessWidget {
  final i;
  final controller;
  const Imagepartitems({super.key, this.i, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          height: 100,
          width: 100,
          "${appLink.imagenitemsview}/${controller.items[i]["main_image"]}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
