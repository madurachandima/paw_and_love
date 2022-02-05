import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Home/Profiles/DogProfile/controller/profile_controller.dart';
import 'package:paw_and_love/Utils/const.dart';
import 'package:sizer/sizer.dart';
import 'package:paw_and_love/Utils/utill.dart';
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
                expandedHeight: 50.h,
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
                          height: 8.h,
                          width: 8.w,
                          bottom: 10,
                          left: 80.w,
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
                      isReadOnly: false,
                      textEditingController:
                          _profileController.dogNameController,
                      isPass: false,
                      hintText: "Dog Name",
                      lableText: "Please Enter Dog Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: CustomeTextInputField(
                      isReadOnly: false,
                      textEditingController:
                          _profileController.dogOwnerNameController,
                      isPass: false,
                      hintText: "Dog Owner Name",
                      lableText: "Please Enter Dog Owner Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 8.h,
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
                          labelStyle: TextStyle(
                              color: ColorConfig.orange,
                              fontSize: 13.sp,
                              fontFamily: REGULAR_FONT),
                          hintText: "Dog Breed",
                          hintStyle: TextStyle(
                              color: ColorConfig.orange,
                              fontSize: 13.sp,
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
                  child: Obx(() => CustomeTextInputField(
                      callbackFunction: () async {
                        DateTime? selectedDate = await getDate(context);

                        if (selectedDate != null) {
                          String date = selectedDate.year.toString() +
                              " / " +
                              selectedDate.month.toString() +
                              " / " +
                              selectedDate.day.toString();
                          _profileController.dogBirthDateController.value.text =
                              date;

                          // var a = daysBetween(
                          //     DateTime(selectedDate.year, selectedDate.month,
                          //         selectedDate.day),
                          //     DateTime.now());

                          // if (a > 0) {
                          //   getDaysByWeeks(a);
                          // } else {
                          //   // show error
                          //   debugPrint("Invalid dog birthdate");
                          // }
                        } else {
                          _profileController.dogBirthDateController.value.text =
                              "";
                        }
                      },
                      isReadOnly: true,
                      textEditingController:
                          _profileController.dogBirthDateController.value,
                      isPass: false,
                      hintText: "Dog Birth Date",
                      lableText: "Please Select Dog Birth Date",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 13.sp, color: ColorConfig.orange),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40.w,
                            child: Obx(() => RadioListTile<DogGender>(
                                  activeColor: ColorConfig.orange,
                                  title: Text(
                                    'Male',
                                    style: TextStyle(
                                        color: ColorConfig.orange,
                                        fontSize: 13.sp),
                                  ),
                                  value: DogGender.male,
                                  groupValue: _profileController.gender.value,
                                  onChanged: (value) {
                                    _profileController.gender.value = value!;
                                  },
                                )),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 40.w,
                            child: Obx(() => RadioListTile<DogGender>(
                                  activeColor: ColorConfig.orange,
                                  title: Text(
                                    'Female',
                                    style: TextStyle(
                                        color: ColorConfig.orange,
                                        fontSize: 13.sp),
                                  ),
                                  value: DogGender.female,
                                  groupValue: _profileController.gender.value,
                                  onChanged: (value) {
                                    _profileController.gender.value = value!;
                                  },
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
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
