import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telechat/core/services/api_services.dart';
import 'package:telechat/models/message_model.dart';
import 'package:web_socket_channel/io.dart';
import '../models/users_model.dart';

class MessageController extends GetxController {
  var messages = <MessageModel>[].obs;

  var user = UsersModel().obs;
  RxBool isLoading = RxBool(false);
  final message = TextEditingController();

  late IOWebSocketChannel channel;

  void websocket () async {
    channel = IOWebSocketChannel.connect('ws://127.0.0.1:6001/app/test');

    await channel.ready;

    channel.sink.add(jsonEncode({
      'event' : 'pusher:subscribe',
      'data' : {
        'channel' : 'chat.1',
      }
    }));

    channel.stream.listen((event) {
      final decoded = jsonDecode(event);

      if (decoded['event'] == 'App\\Events\\MessageSentEvent') {
        print(event);

        final messageData = jsonDecode(decoded['data']);

        messages.add(MessageModel(
          senderId: messageData['sender_id'],
          receiverId: messageData['receiver_id'],
          message: messageData['message'],
          chatID: messageData['chat_id'],
          createdAt: DateTime.parse(messageData['created_at']),
          isMe: messageData['sender_id'] == 2, // Logged In User ID
        ));
      }

    });
  }


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
