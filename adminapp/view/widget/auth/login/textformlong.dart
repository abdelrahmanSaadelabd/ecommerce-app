import 'package:flutter/material.dart';

class Textformlongin extends StatefulWidget {
  final String HidText;
  final TextEditingController? controller;
  final TextEditingController? controllertowe;
  final String HidTexttowe;
  final Widget PrefixIcon;
  final Widget PrefixIcontowe;
  final String? Function(String?)? validator;
  final String? Function(String?)? validatortowe;
  final GlobalKey<FormState> formKey;

  const Textformlongin({
    super.key,
    required this.HidText,
    required this.PrefixIcon,
    required this.HidTexttowe,
    required this.PrefixIcontowe,
    required this.validator,
    this.controller,
    this.controllertowe,
    required this.formKey,
    this.validatortowe,
  });

  @override
  State<Textformlongin> createState() => _TextformlonginState();
}

class _TextformlonginState extends State<Textformlongin> {
  bool obscureText = true;

  void showpassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 215, 86),
                spreadRadius: -5,
                blurRadius: 40,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              // Email Field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                ),
                child: TextFormField(
                  controller: widget.controller,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    prefixIcon: widget.PrefixIcon,
                    hintText: widget.HidText,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),

              // Divider
              Container(height: 1, color: Colors.grey.shade300),

              // Password Field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                ),
                child: TextFormField(
                  obscureText: obscureText,
                  validator: widget.validatortowe,
                  controller: widget.controllertowe,
                  decoration: InputDecoration(
                    prefixIcon: widget.PrefixIcontowe,
                    suffixIcon: InkWell(
                      onTap: showpassword,
                      child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    hintText: widget.HidTexttowe,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
