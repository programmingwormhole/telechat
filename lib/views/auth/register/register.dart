import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          'Sign Up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => InkWell(
                    onTap: () => controller.pickImage(),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        image: controller.selectedImage.value.path == ''
                            ? null
                            : DecorationImage(
                                image: FileImage(
                                  controller.selectedImage.value,
                                ),
                                fit: BoxFit.cover,
                              ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomField(
                  label: 'Name',
                  hintText: 'Enter your full name',
                  onChanged: (value) {
                    controller.userModel.value.name = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                  label: 'Phone Number',
                  hintText: 'Enter your phone number',
                  onChanged: (value) {
                    controller.userModel.value.phone = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                  label: 'Email Address',
                  hintText: 'Enter your email address',
                  onChanged: (value) {
                    controller.userModel.value.email = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                  label: 'Date Of Birth',
                  hintText: 'yyyy-mm-dd',
                  onChanged: (value) {
                    controller.userModel.value.dateOfBirth = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => CustomField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    isSecured: controller.isSecured.value,
                    onChanged: (value) {
                      controller.userModel.value.password = value;
                    },
                    trailing: IconButton(
                      onPressed: () {
                        controller.isSecured.value =
                            !controller.isSecured.value;
                      },
                      icon: Icon(
                        controller.isSecured.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => CustomButton(
                    label:
                        controller.isLoading.value ? 'Loading...' : 'Sign Up',
                    onTap: () => controller.register(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
