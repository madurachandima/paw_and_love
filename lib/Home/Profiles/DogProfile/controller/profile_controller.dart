import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  DateTime? birthdate;
  int? birthdateByWeeks;
  String? dogBreed = "";
  var profileImage = "".obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
      // if (age < 16) {
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
      // } else {
      //   debugPrint("cccc");
      // }
    }
    print(recommendedVaccines);
    print(optionalVaccines);
  }

  Future<String?> saveNewDogprofile() async {
    String? _dogName = dogNameController.text;
    String? _dogOwnerName = dogOwnerNameController.text;
    DateTime? _birthDate = birthdate;
    int? _ageByWeek = birthdateByWeeks;
    String? _dogBreed = dogBreed;

    debugPrint(birthdateByWeeks.toString());
    if (_dogName == "") {
      return "Dog Name is Can't be Empty";
    } else if (_dogOwnerName == "") {
      return "Dog Owner Name is Can't be Empty";
    } else if (_dogBreed == "") {
      return "Dog Breed Can't be Empty";
    } else if (_ageByWeek == 0) {
      return "Invalid birthdate";
    } else if (_ageByWeek == null) {
      return "Dog birthdate can't be empty";
    }

    try {
      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("dog_profiles")
          .doc()
          .set({
        'dog_name': _dogName,
        'owner_name': _dogOwnerName,
        'dog_breed': _dogBreed,
        'dog_profile_url': "",
        'dog_birhdate': _birthDate,
        'dog_gender': gender.value.name,
        'recomonded_vaccine': recommendedVaccines,
        'optional_vaccine': optionalVaccines
      });
    } on FirebaseException catch (err) {
      return err.message;
    } catch (e) {
      return "Somthing is wrong";
    }
    clearTextFields();
    return "success";
  }

  clearBirthdates() {
    birthdateByWeeks = 0;
    recommendedVaccines.clear();
    optionalVaccines.clear();
  }

  clearTextFields() {
    dogNameController.clear();
    dogOwnerNameController.clear();
    dogBirthDateController.value.clear();
    dogBreed = "";
    gender.value = DogGender.male;
    recommendedVaccines.clear();
    optionalVaccines.clear();
  }
}
