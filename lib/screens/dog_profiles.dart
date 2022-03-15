import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Widgets/dog_profile_circuler_avatar.dart';
import 'package:paw_and_love/controller/home_controller.dart';
import 'package:paw_and_love/screens/dog_add_new_profile.dart';
import 'package:paw_and_love/screens/login.dart';

import 'package:sizer/sizer.dart';

class DogProfile extends StatelessWidget {
  const DogProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () async {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Log Out'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Are you sure ?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.of(context).pop();
                                    Get.off(() => const Login());
                                  },
                                ),
                                TextButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.logout_outlined),
                    ),
                  )
                ],
                expandedHeight: 50.h,
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
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('dog_profiles')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Wrap(
                  children: [
                    Wrap(
                      children: snapshot.data!.docs.map((item) {
                        List notifications = [];

                        for (var i = 0;
                            i < _controller.notificationList.length;
                            i++) {
                          if (_controller
                                  .notificationList[i][0].entries.first.key ==
                              item.id) {
                            notifications = _controller.notificationList[i];
                          }
                        }

                        return DogProfileCircularAvatar(
                          notification: notifications,
                          snap: item,
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 20.h,
                        width: 25.w,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => const AddNewDogProfile());
                            },
                            icon: const Icon(
                              CupertinoIcons.add_circled,
                              size: 100,
                              color: ColorConfig.yellow,
                            )),
                      ),
                    )
                  ],
                );
              })),
    );
  }
}
