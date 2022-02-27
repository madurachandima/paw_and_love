import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Widgets/chat_bot_view.dart';
import 'package:paw_and_love/Widgets/dog_symptoms_view.dart';
import 'package:paw_and_love/Widgets/search_textfield.dart';
import 'package:paw_and_love/controller/dog_common_disses_controller.dart';
import 'package:sizer/sizer.dart';

class DogCommonDisses extends StatelessWidget {
  const DogCommonDisses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DogCommonDissesController _dissesController =
        Get.put(DogCommonDissesController());
    TextEditingController _searchController = TextEditingController();
    _searchSymptoms() {
      debugPrint("search");
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return const ChatBotView();
                },
              );
            },
            icon: Icon(
              CupertinoIcons.text_bubble_fill,
              size: 11.w,
              color: ColorConfig.blue,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SearchTextField(
                callbackFunction: _searchSymptoms,
                textEditingController: _searchController,
                hintText: "Search here",
                lableText: "Search here",
                textInputType: TextInputType.text,
                textColor: ColorConfig.orange,
              ),
            ),
            const DogSymptomsView()
          ],
        ),
      )),
    );
  }
}
