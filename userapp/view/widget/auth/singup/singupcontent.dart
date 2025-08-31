import 'package:flutter/material.dart';
import 'package:untitled1/controller/auth_controller/singup_controller/singup_controller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/core/functions/validupt.dart';
import 'package:untitled1/view/widget/auth/login/batton.dart';
import 'package:untitled1/view/widget/auth/singup/textfomfiled.dart';

class SignupFormContent extends StatelessWidget {
  final SingupController controller;

  final double screenHeught;
  final double screenWidth;

  const SignupFormContent({
    super.key,
    required this.controller,

    required this.screenHeught,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;

          return Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
            ),

            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Image(image: AssetImage("assets/image/logo.png")),
                  ),
                ),

                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: handlingRqust(
                      statusRequst:
                          controller.statusRequst ?? StatusRequst.none,
                      widget: Column(
                        children: [
                          TextfromfiledSingup(
                            controller: controller.email,
                            controllertowe: controller.name,
                            controllerthree: controller.phone,
                            controllerfour: controller.password,

                            validator: (val) => validupt(val!, 5, 200, "email"),
                            validatortowe:
                                (val) => validupt(val!, 5, 200, "username"),
                            validatorthree:
                                (val) => validupt(val!, 5, 200, "phone"),
                            validatorfour:
                                (val) => validupt(val!, 5, 200, "password"),
                            HidTextsingup: "Enter Email",
                            HidTexttowesingup: "Enter Username",
                            HidTextthreesingup: "Enter phone",
                            HidTextfouringup: "Password",
                            PrefixIconsingup: Icon(
                              color: Color.fromARGB(255, 255, 196, 0),
                              Icons.email,
                            ),
                            PrefixIcontowesingup: Icon(
                              color: Color.fromARGB(255, 255, 196, 0),
                              Icons.person_rounded,
                            ),
                            PrefixIconsthreeingup: Icon(
                              color: Color.fromARGB(255, 255, 196, 0),
                              Icons.key,
                            ),
                            PrefixIconsfouringup: Icon(
                              color: Color.fromARGB(255, 255, 196, 0),
                              Icons.key,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Battonauth(
                              textbatton: "Sing UP",
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.postData(context);
                                } else {
                                  print("Invalid inputs");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
