import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telechat/controllers/home_controller.dart';
import 'package:telechat/controllers/message_controller.dart';
import 'package:telechat/core/services/shared_services.dart';
import 'package:telechat/views/auth/login/login.dart';
import 'package:telechat/views/messages/messages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final messageController = Get.put(MessageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              SharedServices.removeData('token');
              Get.offAll(() => const LoginScreen());
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemBuilder: (_, index) {
              final user = controller.users[index];

              return ListTile(
                onTap: () {
                  messageController.user.value = user;
                  Get.to(
                        () => MessageScreen(),
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePicture!),
                ),
                title: Text(user.name!),
                subtitle: Text(user.email!),
              );
            },
            itemCount: controller.users.length,
          );
        }
      }),
    );
  }
}
