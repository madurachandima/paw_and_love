import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Utils/utill.dart';
import 'package:sizer/sizer.dart';
import 'package:paw_and_love/Widgets/custome_text_input_field.dart';

class ViewDogProfile extends StatelessWidget {
  final snap;
  const ViewDogProfile({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    convertTimestampDate(date) {
      return daysBetween(
          DateTime.parse(DateFormat("yyyy-MM-dd")
              .format(DateTime.parse(date.toDate().toString()))),
          DateTime.now());
    }

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                expandedHeight: 50.h,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    snap['dog_name'],
                  ),
                  background: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: snap['dog_profile_url'],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  child: Text(
                    "Dog Breed",
                    style: TextStyle(color: ColorConfig.orange),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: CustomeTextInputField(
                      isReadOnly: true,
                      textEditingController:
                          TextEditingController(text: snap['dog_breed']),
                      isPass: false,
                      hintText: "Dog Name",
                      lableText: "Please Enter Dog Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  child: Text(
                    "Dog Gender",
                    style: TextStyle(color: ColorConfig.orange),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: CustomeTextInputField(
                      isReadOnly: true,
                      textEditingController: TextEditingController(
                          text: snap['dog_gender'].toString().toUpperCase()),
                      isPass: false,
                      hintText: "Dog Owner Name",
                      lableText: "Please Enter Dog Owner Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  child: Text(
                    "Dog Birthdate",
                    style: TextStyle(color: ColorConfig.orange),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: CustomeTextInputField(
                      isReadOnly: true,
                      textEditingController: TextEditingController(
                          text: DateFormat.yMMMd()
                              .format(snap['dog_birthdate'].toDate())
                              .toString()),
                      isPass: false,
                      hintText: "Dog Owner Name",
                      lableText: "Please Enter Dog Owner Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  child: Text(
                    "Dog Age by Weeks",
                    style: TextStyle(color: ColorConfig.orange),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: CustomeTextInputField(
                      isReadOnly: true,
                      textEditingController: TextEditingController(
                          text: convertTimestampDate(snap['dog_birthdate'])
                              .toString()),
                      isPass: false,
                      hintText: "Dog Owner Name",
                      lableText: "Please Enter Dog Owner Name",
                      textInputType: TextInputType.text,
                      textColor: ColorConfig.orange),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Text(
                        "Dog Vaccination Details",
                        style: TextStyle(color: ColorConfig.orange),
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: ColorConfig.orange,
                    ),
                    if (snap['recomonded_vaccine'].length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            child: Text(
                              "Recomonded Vaccination Details",
                              style: TextStyle(
                                  color: ColorConfig.orange, fontSize: 14.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snap['recomonded_vaccine'].length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return snap['recomonded_vaccine'][index]
                                          .entries
                                          .first
                                          .value['isVaccinated']
                                      ? Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              flex: 5,
                                              fit: FlexFit.tight,
                                              child: Text(
                                                  snap['recomonded_vaccine']
                                                          [index]
                                                      .entries
                                                      .first
                                                      .key
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color:
                                                          ColorConfig.orange)),
                                            ),
                                            const Spacer(),
                                            Flexible(
                                                flex: 5,
                                                fit: FlexFit.tight,
                                                child: Text(
                                                    DateFormat.yMMMd()
                                                        .format(
                                                            snap['recomonded_vaccine']
                                                                    [index]
                                                                .entries
                                                                .first
                                                                .value[
                                                                    'dateTime']
                                                                .toDate())
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: ColorConfig
                                                            .orange)))
                                          ],
                                        )
                                      : Container();
                                }),
                          ),
                        ],
                      ),
                    if (snap['optional_vaccine'].length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            child: Text(
                              "Optional Vaccination Details",
                              style: TextStyle(
                                  color: ColorConfig.orange, fontSize: 14.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snap['optional_vaccine'].length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return snap['optional_vaccine'][index]
                                          .entries
                                          .first
                                          .value['isVaccinated']
                                      ? Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                                flex: 5,
                                                fit: FlexFit.tight,
                                                child: Text(
                                                    snap['optional_vaccine']
                                                            [index]
                                                        .entries
                                                        .first
                                                        .key
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: ColorConfig
                                                            .orange))),
                                            const Spacer(),
                                            Flexible(
                                                flex: 5,
                                                fit: FlexFit.tight,
                                                child: Text(
                                                    DateFormat.yMMMd()
                                                        .format(
                                                            snap['optional_vaccine']
                                                                    [index]
                                                                .entries
                                                                .first
                                                                .value[
                                                                    'dateTime']
                                                                .toDate())
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: ColorConfig
                                                            .orange)))
                                          ],
                                        )
                                      : Container();
                                }),
                          ),
                        ],
                      ),
                  ],
                )
              ]))
            ];
          },
          body: Container()),
    );
  }
}
