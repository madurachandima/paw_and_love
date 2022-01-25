import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

showSnackbar(
    {required String title,
    required String message,
    required SnackPosition position,
    required Color backgroundColor}) {
  Get.snackbar(
    title,
    message,
    snackPosition: position,
    backgroundColor: backgroundColor,
  );
}
