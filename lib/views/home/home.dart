import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telechat/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
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
