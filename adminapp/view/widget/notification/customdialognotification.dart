import 'package:flutter/material.dart';

class Customdialognotification extends StatelessWidget {
  final String titledilog;
  final double? fontsize;
  final Color? Colortitle;
  final String? contentdilog;
  final String? namebottomdilog1;
  final Color? dilogiconcolor;
  final IconData? dilogicon;

  final void Function()? onPressed;
  final Widget? content;

  const Customdialognotification({
    required this.titledilog,
    this.fontsize,
    this.Colortitle,
    this.contentdilog,
    this.namebottomdilog1,
    this.dilogiconcolor,
    this.dilogicon,

    this.content,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: const Color.fromARGB(255, 255, 236, 178),
      title: Center(
        child: Text(
          titledilog,
          style: TextStyle(
            fontSize: fontsize ?? 18,
            color: Colortitle ?? Colors.black,
          ),
        ),
      ),
      content:
          content ??
          (contentdilog != null
              ? Text(contentdilog!, style: TextStyle(fontSize: 16))
              : null),
      actions: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onPressed,
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
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
                        namebottomdilog1 ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      icon:
          dilogicon != null
              ? Icon(
                dilogicon,
                color: dilogiconcolor ?? Colors.black,
                size: 100,
              )
              : null,
    );
  }
}
