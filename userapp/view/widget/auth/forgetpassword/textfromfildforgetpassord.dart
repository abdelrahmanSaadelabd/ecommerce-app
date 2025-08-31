import 'package:flutter/material.dart';

class Textfromfildforgetpassord extends StatefulWidget {
  final String HidTextsingup;
  final String HidTextthreesingup;

  final TextEditingController? controller;

  final String? Function(String?)? validator;
  final String? Function(String?)? validatortowe;
  final String? Function(String?)? validatorthree;
  final String HidTexttowesingup;
  final Widget PrefixIconsingup;
  final Widget PrefixIconsthreeingup;

  final Widget PrefixIcontowesingup;
  const Textfromfildforgetpassord({
    super.key,
    required this.HidTextsingup,
    required this.HidTextthreesingup,

    required this.HidTexttowesingup,
    required this.PrefixIconsingup,
    required this.PrefixIconsthreeingup,

    required this.PrefixIcontowesingup,

    this.controller,
    this.validator,
    this.validatortowe,
    this.validatorthree,
  });

  @override
  State<Textfromfildforgetpassord> createState() =>
      _TextfromfildforgetpassordState();
}

class _TextfromfildforgetpassordState extends State<Textfromfildforgetpassord> {
  bool obscureText = true;
  void showpassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
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
            // الحقل الأول
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              ),
              child: TextFormField(
                validator: widget.validator,
                controller: widget.controller,
                decoration: InputDecoration(
                  prefixIcon: widget.PrefixIconsingup,
                  hintText: widget.HidTextsingup,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),

            // الفاصل بين الحقلين
            Container(height: 1, color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }
}
