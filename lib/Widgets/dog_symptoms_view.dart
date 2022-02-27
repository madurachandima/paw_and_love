import 'package:flutter/material.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:sizer/sizer.dart';

class DogSymptomsView extends StatelessWidget {
  const DogSymptomsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorConfig.yellow,
      child: SizedBox(
        height: 15.h,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Parvo virus",
              style: TextStyle(color: ColorConfig.white),
            )
          ],
        ),
      ),
    );
  }
}
