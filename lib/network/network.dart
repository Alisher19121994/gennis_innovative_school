import 'dart:convert';
import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import 'package:gennis_innovative_school/pages/registration/model/sign_in.dart';
//import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../pages/registration/model/login_response.dart';


class Network {
  static const String baseUrl = "http://192.168.1.23:5000/api/";
  // POST Login
  static Future<String?> loginUser(LogIn logIn) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.23:5000/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': logIn.username,
        'password': logIn.password,
      }),
    );
    var logger = Logger();
    if (response.statusCode == 200) {
      logger.i(response.body);

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
      Uri.parse('http://192.168.1.23:5000/api/my_groups/$id'),
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

   static Future<http.Response> getData(String api,String id) async {
     final accessToken = SharedPreferenceData.getToken();
     final response = await http.get(
      Uri.parse("$baseUrl$api/$id"),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 401) {
      final newAccessToken = await _getNewAccessToken();
      final newResponse = await http.get(
        Uri.parse("$baseUrl$api"),
        headers: {"Authorization": "Bearer $newAccessToken"},
      );
      return newResponse;
    } else {
      return response;
    }
  }

  static Future<String> _getNewAccessToken() async {
    var userData = SharedPreferenceData.getUsername();
    var passwordData = SharedPreferenceData.getPassword();
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: {
        "username": userData,
        "password": passwordData,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to get new access token");
    }
  }
}
