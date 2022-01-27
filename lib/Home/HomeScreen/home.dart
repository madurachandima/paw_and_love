import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Config/assets_path.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Home/Profiles/DogProfile/dog_profiles.dart';
import 'package:paw_and_love/Home/breeders&sellers/breeders_&_sellers.dart';
import 'package:paw_and_love/Home/commonDisses/common_disses.dart';
import 'package:paw_and_love/Home/veterinarian/veterinarian.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: const TextSpan(
                    text: "What are you looking for, ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: REGULAR_FONT,
                        fontSize: 35,
                        fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                    text: "User\n",
                    style: TextStyle(fontSize: 30, color: ColorConfig.yellow),
                  ),
                ])),
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
    ));
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
                  width: MediaQuery.of(context).size.width / 2.70,
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset(image),
                  )),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 15, fontFamily: REGULAR_FONT),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
