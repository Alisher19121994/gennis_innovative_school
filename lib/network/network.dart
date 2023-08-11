import 'dart:convert';
import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import 'package:gennis_innovative_school/pages/registration/model/sign_in.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Network {
  // POST Login
  // static Future<String?> loginUser(LogIn logIn) async {
  //   final response = await http.post(
  //     Uri.parse('http://192.168.1.10:5000/api/login'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'username': logIn.username,
  //       'password': logIn.password,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return null;
  //   }
  // }

}
