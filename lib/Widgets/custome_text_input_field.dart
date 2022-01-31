import 'package:flutter/material.dart';
import 'package:paw_and_love/Config/font_config.dart';

class CustomeTextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String lableText;
  final TextInputType textInputType;
  final Color textColor;

  const CustomeTextInputField({
    Key? key,
    required this.textEditingController,
    required this.isPass,
    required this.hintText,
    required this.lableText,
    required this.textInputType,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: textColor,
      ),
    );

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: textColor,
        width: 2.0,
      ),
    );
    return TextField(
      controller: textEditingController,
      style:
          TextStyle(color: textColor, fontSize: 15, fontFamily: REGULAR_FONT),
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle:
            TextStyle(color: textColor, fontSize: 18, fontFamily: REGULAR_FONT),
        hintText: hintText,
        hintStyle:
            TextStyle(color: textColor, fontSize: 15, fontFamily: REGULAR_FONT),
        fillColor: textColor,
        focusedBorder: inputBorder,
        filled: false,
        enabledBorder: outlineInputBorder,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
