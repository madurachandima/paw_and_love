import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VetProfileController extends GetxController {
  TextEditingController vetNameController = TextEditingController();
  TextEditingController vetPhoneNumberController = TextEditingController();

  String? city = "";
  Uint8List? profileImageByte;
  var profileImage = "".obs;
  var isUploading = false.obs;

  saveVetProfile() {
    return "";
  }
}
