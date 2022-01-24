import 'package:flutter/material.dart';

class MiddleScreen extends StatefulWidget {
  const MiddleScreen({Key? key}) : super(key: key);

  @override
  State<MiddleScreen> createState() => _MiddleScreenState();
}

class _MiddleScreenState extends State<MiddleScreen> {
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Loading");
  }
}

Future checkLoginStatus() async {}
