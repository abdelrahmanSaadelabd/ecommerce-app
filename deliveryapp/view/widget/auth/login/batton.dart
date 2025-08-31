import 'package:flutter/material.dart';

class Battonauth extends StatelessWidget {
  final String textbatton;
  final void Function()? onPressed;
  const Battonauth({super.key, required this.textbatton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeught = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          height: screenHeught * 0.05,
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 255, 196, 0),
                Color.fromARGB(255, 254, 203, 36),
                Color.fromRGBO(255, 210, 60, 1),
                Color.fromARGB(255, 255, 209, 58),
              ],
            ),
          ),
          child: Center(
            child: Text(
              textbatton,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
