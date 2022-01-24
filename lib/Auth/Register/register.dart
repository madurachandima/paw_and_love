import 'package:flutter/material.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Widgets/button.dart';
import 'package:paw_and_love/Widgets/text_input_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  void clickRegisterButton() {
    debugPrint("call function");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.blueViolet,
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: RichText(
                    text: const TextSpan(
                        text: "Welcome \nto ",
                        style: TextStyle(
                            fontFamily: RIGHEOUS,
                            fontSize: 40,
                            fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                        text: "Paw & Love",
                        style: TextStyle(color: ColorConfig.yellow),
                      )
                    ])),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeTextInputField(
                    isPass: false,
                    lableText: "Username",
                    hintText: " Please Input Username",
                    textInputType: TextInputType.text),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeTextInputField(
                    isPass: false,
                    lableText: "Email Address ",
                    hintText: " Please Input Email Address",
                    textInputType: TextInputType.emailAddress),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeTextInputField(
                    isPass: true,
                    lableText: "Password",
                    hintText: " Please Input Password",
                    textInputType: TextInputType.visiblePassword),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeTextInputField(
                    isPass: true,
                    lableText: "Conform Password",
                    hintText: " Please Input Conform Password",
                    textInputType: TextInputType.visiblePassword),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeButton(
                  buttonText: "Register",
                  callbackFunction: clickRegisterButton,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
