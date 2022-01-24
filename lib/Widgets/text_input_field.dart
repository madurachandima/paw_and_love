import 'package:flutter/material.dart';
import 'package:paw_and_love/Config/font_config.dart';

class CustomeTextInputField extends StatelessWidget {
  // final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String lableText;
  final TextInputType textInputType;

  const CustomeTextInputField({
    Key? key,
    // required this.textEditingController,
    required this.isPass,
    required this.hintText,
    required this.lableText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    );
    return TextField(
      // controller: textEditingController,
      style: const TextStyle(
          color: Colors.white, fontSize: 15, fontFamily: RIGHEOUS),
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontFamily: RIGHEOUS),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.white, fontSize: 15, fontFamily: RIGHEOUS),
        fillColor: Colors.white,
        focusedBorder: inputBorder,
        filled: false,
        enabledBorder: outlineInputBorder,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
