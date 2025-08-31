import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationIcon extends StatelessWidget {
  final dynamic width;
  final dynamic height;
  const NotificationIcon({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.13,
      height: height * 0.05,
      decoration: BoxDecoration(
        color: const Color.fromARGB(74, 255, 255, 255),

        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(Icons.notifications_active, color: Colors.white, size: 30),
    );
  }
}
