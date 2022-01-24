import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Auth/Login/screens/login.dart';
import 'package:paw_and_love/Auth/Register/Screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
