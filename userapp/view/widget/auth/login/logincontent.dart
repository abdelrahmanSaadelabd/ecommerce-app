import 'package:flutter/material.dart';
import 'package:untitled1/controller/auth_controller/login/logincontroller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/core/functions/validupt.dart';
import 'package:untitled1/view/widget/auth/login/batton.dart';
import 'package:untitled1/view/widget/auth/login/forgetpassword_login_text.dart';
import 'package:untitled1/view/widget/auth/login/text_dont_have_acount.dart';
import 'package:untitled1/view/widget/auth/login/textformlong.dart';

class Logincontent extends StatelessWidget {
  final Logincontroller controller;

  final double screenHeught;
  final double screenWidth;

  const Logincontent({
    super.key,

    required this.screenHeught,
    required this.screenWidth,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;

          return Container(
            height: height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
            ),
            child: Center(
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Image.asset(
                        "assets/image/logo.png",

                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 4,
                    child: HandlingDataView(
                      statusRequst:
                          controller.statusRequst ?? StatusRequst.none,
                      widget: Column(
                        children: [
                          SizedBox(height: height * 0.05),

                          Textformlongin(
                            formKey: controller.formKey,
                            validator: (val) {
                              return validupt(val!, 5, 200, "email");
                            },
                            validatortowe: (val) {
                              return validupt(val!, 5, 200, "password");
                            },
                            PrefixIcon: const Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 255, 196, 0),
                            ),
                            HidText: "Enter Email",
                            controller: controller.email,
                            HidTexttowe: "Enter Password",
                            controllertowe: controller.password,
                            PrefixIcontowe: const Icon(
                              Icons.key,
                              color: Color.fromARGB(255, 255, 196, 0),
                            ),
                          ),

                          Container(child: ForgetpasswordLoginText()),

                          Container(
                            child: Battonauth(
                              textbatton: "Login",
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  print("Valid inputs");
                                  controller.postData(context);
                                } else {
                                  print("Invalid inputs");
                                }
                              },
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextDontHaveAcount(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
