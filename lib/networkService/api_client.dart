import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth.dart';

class ApiClient {
  static const API_URL = 'https://your-api-url.com';

  static Future<http.Response> get(String path) async {
    Map<String, String> headers = await Auth.getHeaders();

    var response = await http.get(Uri.parse('$API_URL/$path'), headers: headers);
    if (response.statusCode == 401) {

      String token = await Auth.refreshToken();
      headers = {'Authorization': 'Bearer $token'};
      response = await http.get(Uri.parse('$API_URL/$path'), headers: headers);

    } else if (Auth.isTokenExpired(headers['Authorization']!)) {
      String token = await Auth.refreshToken();
      headers = {'Authorization': 'Bearer $token'};

      response = await http.get(Uri.parse('$API_URL/$path'), headers: headers);
    }

    return response;
  }

  static Future<http.Response> post(String path, {dynamic body}) async {
    Map<String, String> headers = await Auth.getHeaders();

    var response = await http.post(Uri.parse('$API_URL/$path'),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 401) {
      // Token has expired, refresh it and try again
      String token = await Auth.refreshToken();
      headers = {'Authorization': 'Bearer $token'};

      response = await http.post(Uri.parse('$API_URL/$path'),
          headers: headers, body: jsonEncode(body));
    } else if (Auth.isTokenExpired(headers['Authorization']!)) {
      // Token has expired since it was last retrieved, refresh it and try again
      String token = await Auth.refreshToken();
      headers = {'Authorization': 'Bearer $token'};

      response = await http.post(Uri.parse('$API_URL/$path'),
          headers: headers, body: jsonEncode(body));
    }

    return response;
  }
}