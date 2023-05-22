import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthToken {
  String? accessToken;
  String? refreshToken;
  DateTime expiryTime;

  AuthToken({this.accessToken, this.refreshToken, required this.expiryTime});

  bool isExpired() {
    return DateTime.now().isAfter(expiryTime);
  }

  static Future<AuthToken> getNewAccessToken(AuthToken oldToken) async {
    if (oldToken.isExpired()) {
      final response = await http.post(
        Uri.parse('https://your-auth-server.com/token'),
        body: {'refresh_token': oldToken.refreshToken},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        return AuthToken(
          accessToken: responseBody['access_token'],
          refreshToken: responseBody['refresh_token'],
          expiryTime: DateTime.now().add(Duration(seconds: responseBody['expires_in'])),
        );
      } else {
        throw Exception('Failed to refresh access token');
      }
    } else {
      return oldToken;
    }
  }
}