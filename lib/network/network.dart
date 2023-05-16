import 'dart:convert';
import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import 'package:gennis_innovative_school/pages/registration/model/sign_in.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/registration/model/login_response.dart';

class Network {
  // POST Login
  static Future loginUser(LogIn logIn) async {
    final response = await http.post(
      Uri.parse('http://176.96.243.55/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': logIn.username,
        'password': logIn.password,
      }),
    );
    LoginResponse loginResponse = LoginResponse();
    var logger = Logger();
    if (response.statusCode == 200) {
      logger.i(response.body);
      SharedPreferenceData.setLoggedIn(loginResponse);
      SharedPreferenceData.setToken(loginResponse);
      SharedPreferenceData.setId(loginResponse);
      return response.body;
    } else {
      return null;
    }
  }

  // GET groups
  static Future getGroups() async {
    var token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    final response = await http.get(
      Uri.parse('http://176.96.243.55/api/my_groups/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        //'id': 'id $id',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      var logger = Logger();
      logger.i(jsonResponse);
      return jsonResponse;
    } else {
      return null;
    }
  }
}
