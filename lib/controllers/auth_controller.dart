import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telechat/models/user_model.dart';

class AuthController extends GetxController {
  RxBool isSecured = RxBool(true);

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
}
