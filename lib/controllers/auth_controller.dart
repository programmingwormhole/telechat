import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telechat/core/services/api_services.dart';
import 'package:telechat/core/services/shared_services.dart';
import 'package:telechat/models/user_model.dart';
import 'package:telechat/views/home/home.dart';

class AuthController extends GetxController {
  RxBool isSecured = RxBool(true);
  RxBool isLoading = RxBool(false);

  var userModel = UserModel().obs;

  var selectedImage = File('').obs;

  pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      selectedImage.value = File(pickedImage.path);
      update();
      userModel.value.profilePicture = selectedImage.value.path;
    }

  }

  register () async {
    isLoading.value = true;

    final response = await ApiServices.register(userModel.value);

    isLoading.value = false;
    update();

    if (response.statusCode != 200) {
      Get.snackbar('Error', response.reasonPhrase!);
      return;
    }

    final decoded = jsonDecode(await response.stream.bytesToString());

    await SharedServices.setData(SetType.string, 'token', decoded['token']);

    Get.offAll(() => const HomeScreen());

  }

  login () async {
    isLoading.value = true;

    final response = await ApiServices.login(userModel.value);

    isLoading.value = false;

    final decode = jsonDecode(response.body);

    if (response.statusCode != 200) {
      Get.snackbar('Error', decode['message']);
      return;
    }

    await SharedServices.setData(SetType.string, 'token', decode['token']);

    Get.offAll(() => const HomeScreen());
  }
}
