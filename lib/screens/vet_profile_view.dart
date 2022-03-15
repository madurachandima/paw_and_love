import 'package:flutter/material.dart';
import 'package:paw_and_love/Config/assets_path.dart';

import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/model/vet_profile_model.dart';

import 'package:sizer/sizer.dart';

import 'package:paw_and_love/Widgets/custome_text_input_field.dart';

class ViewVetProfile extends StatelessWidget {
  final VetProfileModel? vetProfileModel;
  const ViewVetProfile({Key? key, required this.vetProfileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                centerTitle: false,
                elevation: 0,
                expandedHeight: 40.h,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Container(
                      color: ColorConfig.darkBlue,
                      child: Text(
                        "Dr ${vetProfileModel!.vetName}",
                      ),
                    ),
                    background: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        vetProfileModel!.vetProfileUrl!.isEmpty
                            ? Image.asset(
                                doctorProfile,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                vetProfileModel!.vetProfileUrl!,
                                fit: BoxFit.cover,
                              ),
                      ],
                    )),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: CustomeTextInputField(
                      isReadOnly: true,
                      textEditingController: TextEditingController(),
                      isPass: false,
                      hintText: "Your Name",
                      lableText: "Please Enter Your Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),

                // Wrap(
                //   children: [
                //     // Wrap(
                //     //   children: snapshot.data!.docs
                //     //       .map((item) => DogProfileCircularAvatar(
                //     //             snap: item,
                //     //           ))
                //     //       .toList(),
                //     // ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: SizedBox(
                //         height: 20.h,
                //         width: 25.w,
                //         child: IconButton(
                //             onPressed: () {
                //               Get.to(() => const AddNewClinic());
                //             },
                //             icon: const Icon(
                //               CupertinoIcons.add_circled,
                //               size: 100,
                //               color: ColorConfig.yellow,
                //             )),
                //       ),
                //     )
                //   ],
                // ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 20, vertical: 10),
                //   child: CustomeButton(
                //     getxController: _vetProfileController,
                //     buttonText: "Create Profile",
                //     callbackFunction:
                //         _vetProfileController.isUploading.value
                //             ? null
                //             : createNewDogProfle,
                //     backgroundColor: ColorConfig.orange,
                //   ),
                // )
              ]))
            ];
          },
          body: Container(
              // color: CupertinoColors.lightBackgroundGray,
              )),
    );
  }
}
