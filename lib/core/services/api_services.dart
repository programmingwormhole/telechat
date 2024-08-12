import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telechat/helpers/token_helper.dart';
import 'package:telechat/models/user_model.dart';
import 'package:telechat/utils/endpoints.dart';

class ApiServices {
  static Future<http.StreamedResponse> register(UserModel data) async {
    final request = http.MultipartRequest('POST', ApiEndpoints.register);

    request.fields.addAll({
      'email': data.email!,
      'phone': data.phone!,
      'password': data.password!,
      'name': data.name!,
      'date_of_birth': data.dateOfBirth!,
    });

    request.files.add(
      await http.MultipartFile.fromPath(
        'profile_picture',
        data.profilePicture!,
      ),
    );

    request.headers.addAll({
      'Accept': 'application/json',
    });

    final response = await request.send();

    return response;
  }

  static Future<http.Response> login(UserModel data) async {
    return await http.post(
      ApiEndpoints.login,
      headers: {
        'Accept': 'application/json',
      },
      body: data.toLogin(),
    );
  }

  static Future<http.Response> getUsers() async {
    return await http.get(
      ApiEndpoints.users,
      headers: {
        'Accept': 'application/json',
        'Authorization': await authToken(),
      },
    );
  }

  static Future<http.Response> getMessages(String id) async {
    return await http.get(
      Uri.parse('${ApiEndpoints.messages}/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': await authToken(),
      },
    );
  }

  static Future<http.Response> sendMessage(
      String receiverID, String message) async {
    return await http.post(
      ApiEndpoints.sendMessage,
      headers: {
        'Accept': 'application/json',
        'Authorization': await authToken(),
      },
      body: {
        'receiver_id': receiverID,
        'message': message,
        'type': 'text',
      },
    );
  }
}
