import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/auth_controller/login/checkcodelogin_controller.dart';

class CustomDialoglogin extends StatefulWidget {
  final String titledilog;
  final double? fontsize;
  final Color? Colortitle;
  final String? contentdilog;
  final String? namebottomdilog1;
  final Color? dilogiconcolor;
  final IconData? dilogicon;
  final VoidCallback? onPressed1;
  final VoidCallback? onResend; // ⬅️ دالة إعادة الإرسال
  final Widget? content;

  const CustomDialoglogin({
    required this.titledilog,
    this.fontsize,
    this.Colortitle,
    this.contentdilog,
    this.namebottomdilog1,
    this.dilogiconcolor,
    this.dilogicon,
    this.onPressed1,
    this.onResend, // ⬅️ استلام الدالة هنا
    this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDialoglogin> createState() => _CustomDialogloginState();
}

class _CustomDialogloginState extends State<CustomDialoglogin> {
  Timer? _timer;
  int _remainingTime = 60;
  bool _isButtonEnabled = false;
  bool _isLoading = false; // 🔴 متغير اللودينج

  @override
  void initState() {
    super.initState();
    _startTimer(); // تشغيل المؤقت عند فتح الديالوج
  }

  @override
  void dispose() {
    _timer?.cancel(); // التأكد من إيقاف التايمر عند الخروج
    super.dispose();
  }

  /// دالة بدء المؤقت
  void _startTimer() {
    setState(() {
      _remainingTime = 60;
      _isButtonEnabled = false; // تعطيل زر إعادة الإرسال
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel(); // إيقاف المؤقت
        setState(() {
          _isButtonEnabled = true; // تفعيل زر إعادة الإرسال
        });
      }
    });
  }

  /// تنفيذ إرسال الكود مع اللودينج
  void _handleSend() {
    setState(() {
      _isLoading = true; // ✅ تفعيل اللودينج
    });

    widget.onPressed1?.call(); // استدعاء الدالة الأصلية

    setState(() {
      _isLoading = false; // ❌ إيقاف اللودينج بعد انتهاء العملية
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          widget.titledilog,
          style: TextStyle(
            fontSize: widget.fontsize ?? 18,
            color: widget.Colortitle ?? Colors.black,
          ),
        ),
      ),
      content:
          widget.content ??
          (widget.contentdilog != null
              ? Text(widget.contentdilog!, style: TextStyle(fontSize: 16))
              : null),
      actions: [
        Column(
          children: [
            Text(
              '$_remainingTime ثانية',
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
            GetBuilder<CheckcodeloginController>(
              builder:
                  (controller) => MaterialButton(
                    color: Color.fromARGB(255, 255, 179, 0),
                    onPressed:
                        _isButtonEnabled
                            ? () {
                              controller.resendcode(context);
                              _startTimer();
                            }
                            : null,
                    child: Text(
                      "إعادة الإرسال",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed:
                      _isLoading
                          ? null
                          : _handleSend, // ✅ تعطيل الزر أثناء اللودينج
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
                        widget.namebottomdilog1 ?? "",
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
          widget.dilogicon != null
              ? Icon(
                widget.dilogicon,
                color: widget.dilogiconcolor ?? Colors.black,
                size: 100,
              )
              : null,
    );
  }
}
