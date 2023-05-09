import 'dart:convert';

import 'package:gennis_innovative_school/pages/registration/model/sign_in.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Network {
  static String apiUrl = 'http://176.96.243.55/api/login';
  // POST Login
  static Future loginUser(LogIn logIn) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': logIn.username,
        'password': logIn.password,
      }),
    );
    if (response.statusCode == 200) {
      var logger = Logger();
      logger.d(response.body);
      return response.body;
    //  return LogIn.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login.');
    }
  }
  ////////////////////////////////////////////////////////////

}
