
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../network/sharedPreferenceData/shared_preference_data.dart';

class Auth {
  static const API_URL = 'https://your-api-url.com';

  static Future<Map<String, String>> getHeaders() async {
    String? token = await SharedPreferenceData.getToken();
    if (token == null) {throw Exception('No token found.');}
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    return headers;
  }

  static Future<String> refreshToken() async {
    String? refreshToken = await SharedPreferenceData.getRefreshToken();
    var response = await http.post(Uri.parse('$API_URL/refresh_token'), body: {'refresh_token': refreshToken});
    if (response.statusCode == 200) {
      // Map<String, dynamic> data = jsonDecode(response.body);
      // String newToken = data["access_token"];
      // await SharedPreferenceData.setRefreshToken(newToken);
      return response.body;
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  static bool isTokenExpired(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    int expiryTime = decodedToken['exp'] * 1000;
    return DateTime.now().millisecondsSinceEpoch > expiryTime;
  }
}