import 'package:flutter/material.dart';
import 'package:untitled1/view/widget/home/menuviewhohe.dart';

class Backgroundhome extends StatelessWidget {
  const Backgroundhome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeught = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      child: Container(
        height: screenHeught,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 255, 196, 0),
              Color.fromARGB(255, 255, 205, 39),
              Color.fromARGB(255, 255, 209, 60),
              Color.fromARGB(255, 255, 214, 79),
            ],
          ),
        ),
        child: Menuviewhome(height: screenHeught, width: screenWidth),
      ),
    );
  }
}
