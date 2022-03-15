import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Services/vet_profile_methods.dart';

class VetProfileController extends GetxController {
  TextEditingController vetNameController = TextEditingController();
  TextEditingController vetPhoneNumberController = TextEditingController();
  TextEditingController aboutvetController = TextEditingController();

  String? city = "";
  String? cliniCity = "";
  Uint8List? profileImageByte;
  var profileImage = "".obs;
  var isUploading = false.obs;
  var openDays = "".obs;
  var closeDays = "".obs;

  @override
  void onInit() {
    super.onInit();
    () async {
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snap.get("username") != "") {
        vetNameController.text = snap.get("username");
      }
    }();
  }

  saveVetProfile() async {
    return await VetProfileMethods().createNewVetprofile(
        vetName: vetNameController.text,
        phoneNumber: vetPhoneNumberController.text,
        city: city,
        aboutVet: aboutvetController.text,
        profileImageByte: profileImageByte);
  }
}
