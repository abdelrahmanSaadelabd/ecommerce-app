import 'package:adminapp/view/widget/auth/login/textpart.dart';
import 'package:flutter/material.dart';

class Backgroundlogin extends StatelessWidget {
  final data;
  final status;
  const Backgroundlogin({super.key, required this.data, this.status});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeught = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius:
          status
              ? BorderRadius.only(bottomRight: Radius.circular(350))
              : BorderRadius.only(topLeft: Radius.circular(350)),
      child: Container(
        height: screenHeught,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 255, 196, 0),
              Color.fromARGB(255, 254, 203, 36),
              Color.fromRGBO(255, 214, 81, 1),
              Color.fromARGB(255, 255, 217, 92),
            ],
          ),
        ),
        child: buildTextSection(data, status, context),
      ),
    );
  }
}
