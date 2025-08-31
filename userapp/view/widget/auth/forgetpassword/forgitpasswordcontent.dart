import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controller/auth_controller/forgitpassord_controller/checkemailcontroller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/core/functions/validupt.dart';
import 'package:untitled1/view/widget/auth/forgetpassword/textfromfildforgetpassord.dart';
import 'package:untitled1/view/widget/auth/login/batton.dart';

class Forgitpasswordcontent extends StatefulWidget {
  const Forgitpasswordcontent({super.key});

  @override
  State<Forgitpasswordcontent> createState() => _ForgitpasswordcontentState();
}

class _ForgitpasswordcontentState extends State<Forgitpasswordcontent> {
  @override
  Widget build(BuildContext context) {
    Checkemailcontroller controller = Get.find();

    final screenHeught = MediaQuery.of(context).size.height;
    return Form(
      key: controller.keyform,
      child: Center(
        child: Container(
          height: screenHeught,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
          ),

          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Image(image: AssetImage("assets/image/logo.png")),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: HandlingDataView(
                    statusRequst: controller.statusRequst ?? StatusRequst.none,
                    widget: Column(
                      children: [
                        Textfromfildforgetpassord(
                          controller: controller.email,

                          validator: (val) {
                            return validupt(val!, 5, 200, "email");
                          },
                          validatortowe: (val) {
                            return validupt(val!, 5, 200, "password");
                          },
                          validatorthree: (val) {
                            return validupt(val!, 5, 200, "password");
                          },

                          HidTextsingup: "Enter Email",

                          HidTextthreesingup: "confrom Password",
                          HidTexttowesingup: "Enter Password",
                          PrefixIconsingup: Icon(
                            color: Color.fromARGB(255, 255, 196, 0),
                            Icons.email,
                          ),

                          PrefixIconsthreeingup: Icon(
                            color: Color.fromARGB(255, 255, 196, 0),
                            Icons.key,
                          ),
                          PrefixIcontowesingup: Icon(
                            color: Color.fromARGB(255, 255, 196, 0),
                            Icons.key,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Battonauth(
                            textbatton: "check",
                            onPressed: () {
                              if (controller.keyform.currentState!.validate()) {
                                controller.postData(context);
                              } else {
                                print("erro");
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
        ),
      ),
    );
  }
}
