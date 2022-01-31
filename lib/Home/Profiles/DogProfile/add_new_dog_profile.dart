import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Home/Profiles/DogProfile/controller/profile_controller.dart';
import 'package:paw_and_love/Utils/const.dart';
import 'package:paw_and_love/Widgets/custome_text_input_field.dart';

class AddNewDogProfile extends StatelessWidget {
  const AddNewDogProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController _profileController = Get.put(ProfileController());
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
                    "Add New Profile",
                  ),
                  background: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=362&q=80",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          height: 50,
                          width: 50,
                          bottom: 10,
                          left: MediaQuery.of(context).size.width / 1.2,
                          child: IconButton(
                              onPressed: () {
                                debugPrint("Click");
                              },
                              icon: const Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.black54,
                                size: 50,
                              )))
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: CustomeTextInputField(
                      textEditingController:
                          _profileController.dogNameController,
                      isPass: false,
                      hintText: "Dog Name",
                      lableText: "Please Enter Dog Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 60,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white,
                        iconTheme: const IconThemeData(
                          color: ColorConfig.orange,
                        ),
                      ),
                      child: DropdownSearch(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Please Select Dog Breed",
                          labelStyle: const TextStyle(
                              color: ColorConfig.orange,
                              fontSize: 18,
                              fontFamily: REGULAR_FONT),
                          hintText: "Dog Breed",
                          hintStyle: const TextStyle(
                              color: ColorConfig.orange,
                              fontSize: 15,
                              fontFamily: REGULAR_FONT),
                          fillColor: ColorConfig.orange,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: ColorConfig.orange,
                            ),
                          ),
                          filled: false,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: ColorConfig.orange,
                              width: 2.0,
                            ),
                          ),
                        ),
                        showSearchBox: true,
                        mode: Mode.BOTTOM_SHEET,
                        showSelectedItems: true,
                        items: dogBreeds,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomeTextInputField(
                      textEditingController:
                          _profileController.dogNameController,
                      isPass: false,
                      hintText: "Dog Breed",
                      lableText: "Please Enter Dog Breed",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                )
              ]))
            ];
          },
          body: Container(
              // color: CupertinoColors.lightBackgroundGray,
              )),
    );
  }
}
