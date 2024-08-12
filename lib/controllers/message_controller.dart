import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telechat/core/services/api_services.dart';
import 'package:telechat/models/message_model.dart';
import '../models/users_model.dart';

class MessageController extends GetxController {
  var messages = <MessageModel>[].obs;

  var user = UsersModel().obs;

  RxBool isLoading = RxBool(false);

  final message = TextEditingController();

  getMessages() async {
    isLoading.value = true;

    final response = await ApiServices.getMessages(user.value.id.toString());

    isLoading.value = false;

    messages.value = messageModelFromJson(response.body);
  }

  sendMessage() async {
    final response = await ApiServices.sendMessage(
      user.value.id.toString(),
      message.text.toString(),
    );

    print(response.body);

    message.clear();
  }
}
