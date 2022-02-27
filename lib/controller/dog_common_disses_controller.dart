import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DogCommonDissesController extends GetxController {
  var chatTextController = TextEditingController().obs;
  List<MessageModel> chatMesseges = [];
}

class MessageModel {
  String? message;
  bool? isSend;
  MessageModel(this.message, this.isSend);
}
