import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telechat/core/services/shared_services.dart';
import 'package:telechat/views/auth/login/login.dart';
import 'package:telechat/views/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkToken();
    });
  }

  checkToken () async {
    final token = await SharedServices.getData(SetType.string, 'token');

    if (token != null) {
      Get.offAll(() => const HomeScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 150,
        ),
      ),
    );
  }
}
