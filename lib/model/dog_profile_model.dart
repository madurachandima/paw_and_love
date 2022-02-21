import 'package:cloud_firestore/cloud_firestore.dart';

class DogProfileModel {
  final String? dogName;
  final String? dogOwnerName;
  final String? dogBreed;
  final String? dogProfileUrl;
  final DateTime? birthDate;
  final String? dogGender;
  final List? recommendedVaccines;
  final List? optionalVaccines;

  DogProfileModel(
      {required this.dogName,
      required this.dogOwnerName,
      required this.dogBreed,
      required this.dogProfileUrl,
      required this.birthDate,
      required this.dogGender,
      required this.recommendedVaccines,
      required this.optionalVaccines});

  Map<String, dynamic> toJson() => {
        'dog_name': dogName,
        'owner_name': dogOwnerName,
        'dog_breed': dogBreed,
        'dog_profile_url': dogProfileUrl,
        'dog_birthdate': birthDate,
        'dog_gender': dogGender,
        'recomonded_vaccine': recommendedVaccines,
        'optional_vaccine': optionalVaccines
      };

  static DogProfileModel fromSnap(DocumentSnapshot? snap) {
    var snapshot = snap!.data() as Map<String, dynamic>;

    return DogProfileModel(
        dogName: snapshot['dog_name'],
        dogOwnerName: snapshot['owner_name'],
        dogBreed: snapshot['dog_breed'],
        dogProfileUrl: snapshot['dog_profile_url'],
        birthDate: snapshot['dog_birhdate'],
        dogGender: snapshot['dog_gender'],
        recommendedVaccines: snapshot['recomonded_vaccine'],
        optionalVaccines: snapshot['optional_vaccine']);
  }
}
