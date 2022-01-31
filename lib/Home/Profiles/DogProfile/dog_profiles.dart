import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Home/Profiles/DogProfile/add_new_dog_profile.dart';

class DogProfile extends StatelessWidget {
  const DogProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                backgroundColor: ColorConfig.darkBlue,
                expandedHeight: MediaQuery.of(context).size.height / 2,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text(
                    "Dog Profiles",
                  ),
                  background: Image.network(
                    "https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=362&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Container(
            color: CupertinoColors.lightBackgroundGray,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton(
                        onPressed: () {
                          debugPrint("all");
                          Get.to(() => const AddNewDogProfile());
                        },
                        icon: const Icon(
                          CupertinoIcons.add_circled,
                          size: 100,
                          color: ColorConfig.orange,
                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
