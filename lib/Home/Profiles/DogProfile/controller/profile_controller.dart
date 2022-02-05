import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Utils/utill.dart';
import 'package:paw_and_love/model/vaccination_model.dart';

enum DogGender { male, female }

class ProfileController extends GetxController {
  TextEditingController dogNameController = TextEditingController();
  TextEditingController dogOwnerNameController = TextEditingController();
  var dogBirthDateController = TextEditingController().obs;
  var gender = DogGender.male.obs;
  var vaccinationModel = VaccinationModel().obs;

  @override
  void onInit() {
    super.onInit();
    () async {
      try {
        var response = await readjsonFile(path: "assets/json/vaccination.json");
        vaccinationModel.value = vaccinationModelFromJson(response);
      } catch (e) {
        debugPrint(e.toString());
      }
    }();
  }

  
}
