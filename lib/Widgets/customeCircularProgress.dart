import 'package:flutter/material.dart';
import 'package:paw_and_love/Config/color_config.dart';

class CustomeCircularProgress extends StatelessWidget {
  const CustomeCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorConfig.orange,
      ),
    );
  }
}
