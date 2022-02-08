import 'dart:collection';

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
  VaccinationModel vaccinationModel = VaccinationModel();
  var recommendedVaccines = [].obs;
  var optionalVaccines = [].obs;

  @override
  void onInit() {
    super.onInit();
    () async {
      try {
        var response = await readjsonFile(path: "assets/json/vaccination.json");
        vaccinationModel = vaccinationModelFromJson(response);
      } catch (e) {
        debugPrint(e.toString());
      }
    }();
  }

  getVaccinationByAge({required int age}) {
    for (var i = 0; i < vaccinationModel.ageGroup!.length; i++) {
      var result = vaccinationModel.ageGroup![i].entries.first.key.split('-');
      if (age < 16) {
        if (age >= int.parse(result[0]) && age <= int.parse(result[1])) {
          var values = vaccinationModel.ageGroup![i].entries.first.value;
          recommendedVaccines.clear();
          optionalVaccines.clear();
          for (var i = 0; i < values.last.optional!.length; i++) {
            Map<String, bool> optionalMap = HashMap();
            //optionalMap.entries.first.key
            optionalMap.assign(values.last.optional![i], false);
            optionalVaccines.add(optionalMap);
          }
          for (var i = 0; i < values.first.recommended!.length; i++) {
            Map<String, bool> recomendedMap = HashMap();
            recomendedMap.assign(values.first.recommended![i], false);
            recommendedVaccines.add(recomendedMap);
          }
        }
      } else {
        //todo
      }
    }
    print(recommendedVaccines);
    print(optionalVaccines);
  }
}
