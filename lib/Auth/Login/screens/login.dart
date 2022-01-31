import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Auth/Login/controller/login_controller.dart';
import 'package:paw_and_love/Auth/Register/Screens/register.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Widgets/button.dart';
import 'package:paw_and_love/Widgets/custome_text_input_field.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControler _loginControler = Get.put(LoginControler());
    void clickRegisterButton() {
      debugPrint("call function");
    }

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
                            fontFamily: REGULAR_FONT,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeTextInputField(
                  textEditingController: _loginControler.emailController,
                  isPass: false,
                  lableText: "Email Address ",
                  hintText: " Please Input Email Address",
                  textInputType: TextInputType.emailAddress,
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeTextInputField(
                    textEditingController: _loginControler.passwordController,
                    isPass: true,
                    lableText: "Password",
                    hintText: " Please Input Password",
                    textInputType: TextInputType.visiblePassword,
                    textColor: Colors.white),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: CustomeButton(
                  buttonText: "Sign in",
                  callbackFunction: clickRegisterButton,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                      child: Text(
                    "Don't have a account ? ",
                    style: TextStyle(
                        fontFamily: REGULAR_FONT,
                        color: Colors.white,
                        fontSize: 15),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const Register());
                    },
                    child: const Text("Sign up",
                        style: TextStyle(
                            fontFamily: REGULAR_FONT,
                            color: ColorConfig.yellow,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
