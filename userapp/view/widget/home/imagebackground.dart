import 'package:flutter/widgets.dart';
import 'package:untitled1/controller/core/constant/image.dart';

class Imagebackground extends StatelessWidget {
  final double height;
  final double width;

  const Imagebackground({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Opacity(
          opacity: 0.2,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: height,
              width: width,
              child: Image.asset(APPimage.background, fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}
