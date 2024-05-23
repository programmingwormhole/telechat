import 'package:get/get.dart';
import 'package:telechat/core/services/api_services.dart';
import 'package:telechat/models/users_model.dart';

class HomeController extends GetxController {

  var users = <UsersModel>[].obs;

  RxBool isLoading = RxBool(false);

  @override
  onInit () {
    super.onInit();
    getUsers();
  }

  getUsers () async {
    isLoading.value = true;

    final response = await ApiServices.getUsers();

    isLoading.value = false;

    if (response.statusCode != 200) {
      print(response.body);
      return;
    }

    users.value = usersModelFromJson(response.body);

    update();

  }

}