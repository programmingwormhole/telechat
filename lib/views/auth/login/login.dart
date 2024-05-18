import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telechat/controllers/auth_controller.dart';
import 'package:telechat/utils/colors.dart';
import 'package:telechat/views/auth/register/register.dart';
import 'package:telechat/widgets/custom_button.dart';
import 'package:telechat/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Please enter your details to continue with your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                  CustomButton(
                    label: 'Log In',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const RegisterScreen()),
                    child: Text(
                      'CREATE A NEW ACCOUNT',
                      style: TextStyle(
                        color: AppColors.primary.withOpacity(.5),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
