import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:paw_and_love/Auth/Login/screens/login.dart';
import 'package:paw_and_love/Auth/Register/Controller/registration_controller.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Utils/snackbar.dart';
import 'package:paw_and_love/Widgets/button.dart';
import 'package:paw_and_love/Widgets/text_input_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegistrationController _registrationController =
        Get.put(RegistrationController());
    void clickRegisterButton() async {
      debugPrint("call register function");
      String response = await _registrationController.userRegistration();
      if (response != "success") {
        showSnackbar(
            title: "Error",
            message: response,
            position: SnackPosition.TOP,
            backgroundColor: Colors.transparent);
      } else {
        showSnackbar(
            title: "Success",
            message: "User registration success",
            position: SnackPosition.TOP,
            backgroundColor: Colors.transparent);
      }
    }

    return Scaffold(
      backgroundColor: ColorConfig.blueViolet,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CustomeTextInputField(
                  textEditingController:
                      _registrationController.usernameController,
                  isPass: false,
                  lableText: "Username",
                  hintText: " Please Input Username",
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CustomeTextInputField(
                  textEditingController:
                      _registrationController.emailController,
                  isPass: false,
                  lableText: "Email Address ",
                  hintText: " Please Input Email Address",
                  textInputType: TextInputType.emailAddress),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CustomeTextInputField(
                  textEditingController:
                      _registrationController.passwordController,
                  isPass: true,
                  lableText: "Password",
                  hintText: " Please Input Password",
                  textInputType: TextInputType.visiblePassword),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CustomeTextInputField(
                  textEditingController:
                      _registrationController.conPasswordController,
                  isPass: true,
                  lableText: "Confirm Password",
                  hintText: " Please Input Confirm Password",
                  textInputType: TextInputType.visiblePassword),
            ),
            Obx(() => RadioGroup<String>.builder(
                  horizontalAlignment: MainAxisAlignment.spaceEvenly,
                  direction: Axis.horizontal,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  activeColor: ColorConfig.darkBlue,
                  groupValue: _registrationController.selectedRole.value,
                  onChanged: (value) => _registrationController
                      .selectedRole.value = value.toString(),
                  items: _registrationController.roletypes,
                  itemBuilder: (item) => RadioButtonBuilder(
                    item,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CustomeButton(
                buttonText: "Sign Up",
                callbackFunction: clickRegisterButton,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                    child: Text(
                  "Already have a account ? ",
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
                    Get.to(() => const Login());
                  },
                  child: const Text("Sign In",
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
      )),
    );
  }
}
