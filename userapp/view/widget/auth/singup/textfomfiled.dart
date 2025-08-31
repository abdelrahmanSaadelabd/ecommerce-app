import 'package:flutter/material.dart';

class TextfromfiledSingup extends StatefulWidget {
  final String HidTextsingup;
  final String HidTextthreesingup;
  final String HidTextfouringup;
  final String HidTexttowesingup;
  final Widget PrefixIconsingup;
  final TextEditingController? controller;
  final TextEditingController? controllertowe;
  final TextEditingController? controllerthree;
  final TextEditingController? controllerfour;
  final Widget PrefixIconsthreeingup;
  final Widget PrefixIconsfouringup;
  final Widget PrefixIcontowesingup;
  final String? Function(String?)? validator;
  final String? Function(String?)? validatortowe;
  final String? Function(String?)? validatorthree;
  final String? Function(String?)? validatorfour;

  const TextfromfiledSingup({
    super.key,
    required this.HidTextsingup,
    required this.HidTextthreesingup,
    required this.HidTextfouringup,
    required this.HidTexttowesingup,
    required this.PrefixIconsingup,
    required this.PrefixIconsthreeingup,
    required this.PrefixIconsfouringup,
    required this.PrefixIcontowesingup,

    this.validator,
    this.validatortowe,
    this.validatorthree,
    this.validatorfour,
    this.controller,
    this.controllertowe,
    this.controllerthree,
    this.controllerfour,
  });

  @override
  State<TextfromfiledSingup> createState() => _TextfromfiledSingupState();
}

class _TextfromfiledSingupState extends State<TextfromfiledSingup> {
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

            // الحقل التاني
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
              ),
              child: TextFormField(
                validator: widget.validatortowe,
                controller: widget.controllertowe,
                decoration: InputDecoration(
                  prefixIcon: widget.PrefixIcontowesingup,
                  hintText: widget.HidTexttowesingup,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ), // الفاصل بين الحقلين
            Container(height: 1, color: Colors.grey.shade300),

            // الحقل التاني
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
              ),
              child: TextFormField(
                obscureText: obscureText,
                controller: widget.controllerthree,
                validator: widget.validatorthree,
                decoration: InputDecoration(
                  prefixIcon: widget.PrefixIconsthreeingup,
                  hintText: widget.HidTextthreesingup,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ), // الفاصل بين الحقلين
            Container(height: 1, color: Colors.grey.shade300),

            // الحقل التاني
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
              ),
              child: TextFormField(
                obscureText: obscureText,

                controller: widget.controllerfour,
                validator: widget.validatorfour,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      showpassword();
                    },
                    child: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  prefixIcon: widget.PrefixIconsfouringup,
                  hintText: widget.HidTextfouringup,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
