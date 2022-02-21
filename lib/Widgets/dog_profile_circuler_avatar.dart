import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/screens/dog_profile_view.dart';
import 'package:sizer/sizer.dart';

class DogProfileCircularAvatar extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final snap;
  const DogProfileCircularAvatar({Key? key, required this.snap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ViewDogProfile(snap: snap));
      },
      onLongPress: () {
        debugPrint("long press call");
      },
      child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 20.h,
          width: 25.w,
          child: CircleAvatar(
            backgroundImage:
                CachedNetworkImageProvider(snap['dog_profile_url']),
          )),
    );
  }
}
