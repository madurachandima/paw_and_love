import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController dogNameController = TextEditingController();
  TextEditingController dogOwnerNameController = TextEditingController();
  var dogBirthDateController = TextEditingController().obs;
}
