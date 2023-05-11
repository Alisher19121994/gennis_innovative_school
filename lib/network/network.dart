import 'dart:convert';

import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import 'package:gennis_innovative_school/pages/registration/model/sign_in.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../pages/registration/model/response_logged_in_entity.dart';

class Network {
 // static String apiLogin = 'http://176.96.243.55/api/login';

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
    var logger = Logger();
    ResponseLoggedInEntity responseLoggedInEntity;
    if (response.statusCode == 200) {
     var jsonResponse = json.decode(response.body);
      responseLoggedInEntity = ResponseLoggedInEntity.fromJson(jsonResponse);

      SharedPreferenceData.setLoggedIn(responseLoggedInEntity);
      SharedPreferenceData.setToken(responseLoggedInEntity);
      SharedPreferenceData.setId(responseLoggedInEntity);

      logger.i(jsonResponse);
     // return response.body;
      return jsonResponse;
     // return responseLoggedInEntity;
    } else {
      return null;
    }
  }

  // GET groups
  static Future getGroups() async {
    String token = await SharedPreferenceData.getToken();
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
