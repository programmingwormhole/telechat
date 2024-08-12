import 'package:telechat/utils/config.dart';

class ApiEndpoints {
  static String apiUrl = '${AppConfig.baseUrl}/api';
  static Uri register = Uri.parse('$apiUrl/register');
  static Uri login = Uri.parse('$apiUrl/login');
  static Uri users = Uri.parse('$apiUrl/users');
  static Uri sendMessage = Uri.parse('$apiUrl/send-message');
  static String messages = '$apiUrl/messages';
}