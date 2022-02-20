import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Config/assets_path.dart';

import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Home/HomeScreen/controller/home_controller.dart';
import 'package:paw_and_love/Home/Profiles/DogProfile/dog_profiles.dart';
import 'package:paw_and_love/Home/breeders&sellers/breeders_&_sellers.dart';
import 'package:paw_and_love/Home/commonDisses/common_disses.dart';
import 'package:paw_and_love/Home/veterinarian/veterinarian.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.put(HomeController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Obx(() => RichText(
                      text: TextSpan(
                          text: "What are you looking for, ",
                          style: Theme.of(context).textTheme.headline3,
                          children: [
                        TextSpan(
                            text: _controller.userName.value,
                            style: Theme.of(context).textTheme.headline2),
                      ]))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cardWidget(
                      image: profile,
                      text: "Profile",
                      context: context,
                      pageName: const DogProfile()),
                  const Spacer(),
                  cardWidget(
                      image: disease,
                      text: "Common Disses",
                      context: context,
                      pageName: const CommonDisses())
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cardWidget(
                      image: breeders,
                      text: "Breeders & Selllers",
                      context: context,
                      pageName: const BreedersAndSellers()),
                  const Spacer(),
                  cardWidget(
                      image: clinic,
                      text: "Veterinarian",
                      context: context,
                      pageName: const Veterinarian())
                ],
              )
            ]),
      ),
    );
  }

  Widget cardWidget(
      {required String image,
      required String text,
      required BuildContext context,
      required Widget pageName}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Get.to(() => pageName);
        },
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SizedBox(
                  width: 35.w,
                  height: 20.h,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset(image),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
