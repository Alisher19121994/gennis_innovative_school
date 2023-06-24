import 'dart:convert';

import 'package:gennis_innovative_school/logService/log_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/users_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';
import '../pages/registration/model/login_response.dart';
import 'auth.dart';

class NetworkService {
  static String baseUrl = '176.96.243.55';

  // static Map<String, String> headers = {
  //   'Content-Type': 'application/json; charset=UTF-8',
  //   'Authorization': 'Bearer $token',
  // };

  static Future<Map<String, String>> getHeaders() async {
    String? token = await SharedPreferenceData.getToken();
    if (token == null) {throw Exception('No token found.');}
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    return headers;
  }

  static Future<String?> refreshToken(String api, Map<String, String> params) async {
    String? refreshToken = await SharedPreferenceData.getRefreshToken();
    var uri = Uri.https(baseUrl, api);
    var response = await post(uri, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  static bool isTokenExpired(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    int expiryTime = decodedToken['exp'] * 1000;
    return DateTime.now().millisecondsSinceEpoch > expiryTime;
  }

  /* HTTP request  */
  static Future GETMethod(String api, Map<String, String> params) async {
    Map<String, String> headers = await getHeaders();
    var uri = Uri.http(baseUrl, api, params);
    var response = await get(uri, headers: headers);

    if (response.statusCode == 401) {
      String? token = await refreshToken(api,params);
      headers = {'Authorization': 'Bearer $token'};
      response = await get(uri, headers: headers);

    } else if (Auth.isTokenExpired(headers['Authorization']!)) {
      String? token = await refreshToken(api,params);
      headers = {'Authorization': 'Bearer $token'};
      response = await get(uri, headers: headers);
    }
    return response;
  }

  static Future<List<Students>?> GETUserList(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.http(baseUrl, api, params);
    var response = await get(uri, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },);
    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      return (json as List).map((e) => Students.fromJson(e)).toList();

      // var data = List<Students>.from(json.map((info) => Students.fromJson(info))).toList();
      // return data;
    }
    return null;
  }

  static Future<String?> GET(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.http(baseUrl, api, params);
    var response = await get(uri, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },);
    //LogService.i('network service pars qilish: ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    //String? refreshToken = await SharedPreferenceData.getRefreshToken();
    var uri = Uri.https(baseUrl, api);
    var response = await post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          //'Authorization': 'Bearer $refreshToken',
        },
        body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.https(baseUrl, api);
    var response = await put(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.https(baseUrl, api, params);
    var response = await delete(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Apis */
  static String API_group_profile = '/api/group_profile/';
  /* Http params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreateRefreshToken(LoginResponse loginResponse) {
   // String? refreshToken = await SharedPreferenceData.getRefreshToken();
    Map<String, String> params = {};
    params.addAll({
      'accessToken': loginResponse.data!.accessToken!,
      'id': loginResponse.data!.id.toString(),
      'locationId': loginResponse.data!.locationId.toString(),
      'name': loginResponse.data!.name!,
      'refreshToken': loginResponse.data!.refreshToken!,
      'role': loginResponse.data!.role!,
      'surname': loginResponse.data!.surname!,
      'username': loginResponse.data!.username!,
      'success': loginResponse.success.toString(),

    });
    return params;
  }

  static Map<String, String> paramsCreateStudents(Students students) {
    Map<String, String> params = {};
    params.addAll({
      'age': students.age.toString(),
      'comment': students.comment.toString(),
      'img': students.img.toString(),
      'money': students.money.toString(),
      'moneyType': students.moneyType.toString(),
      'name': students.name.toString(),
      'phone': students.phone.toString(),
      'photoProfile': students.photoProfile.toString(),
      'regDate': students.regDate.toString(),
      'role': students.role.toString(),
      'isTypeChecked': students.isTypeChecked.toString(),
      'surname': students.surname.toString(),
      'username': students.username.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdateStudents(Students students) {
    Map<String, String> params = {};
    params.addAll({
      'age': students.age.toString(),
      'comment': students.comment.toString(),
      'id': students.id.toString(),
      'img': students.img.toString(),
      'money': students.money.toString(),
      'moneyType': students.moneyType.toString(),
      'name': students.name.toString(),
      'phone': students.phone.toString(),
      'photoProfile': students.photoProfile.toString(),
      'regDate': students.regDate.toString(),
      'role': students.role.toString(),
      'isTypeChecked': students.isTypeChecked.toString(),
      'surname': students.surname.toString(),
      'username': students.username.toString(),
    });
    return params;
  }

  static UserList parseUserList(String response) {
   // dynamic json = jsonDecode(response);
    Map<String, dynamic> jsonMap = jsonDecode(response);
    UserList groupInfo = UserList.fromJson(jsonMap);
    return groupInfo;
  }
  static List getList(String response) {
   // Map<String, dynamic> json = jsonDecode(response);
    dynamic json = jsonDecode(response);
    return (json as List).map((e) => UserList.fromJson(e)).toList();
  }
  static List<Students> userList(String response) {
    //final Map<String,dynamic> body = jsonDecode(response);
    //   final UserList userList = UserList.fromJson(body);
    dynamic json = jsonDecode(response);
    var data = List<Students>.from(json.map((info) => Students.fromJson(info))).toList();
    return data;
  }
// static List<Students> parseUserList(String response) {
//   var logger = Logger();
//   dynamic json = jsonDecode(response);
//   var data = List<Students>.from(json.map((info) => Students.fromJson(info)));
//   // final Map<String,dynamic> body = jsonDecode(response);
//   // final UserList userList = UserList.fromJson(body);
//   logger.e(data);
//   return data;
// }

// static Future<Map<String, String>> getHeaders() async {
//   String token = await getToken();
//   if (token == null) {
//     throw Exception('No token found.');
//   }
//
//   Map<String, String> headers = {'Authorization': 'Bearer $token'};
//
//   return headers;
// }
//
// static Future<String> refreshToken() async {
//   String refreshToken = await getRefreshToken();
//   var response = await http.post(Uri.parse('$API_URL/refresh_token'),
//       body: {'refresh_token': refreshToken});
//
//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = jsonDecode(response.body);
//     String newToken = data["access_token"];
//     await setToken(newToken);
//
//     return newToken;
//   } else {
//     throw Exception('Failed to refresh token');
//   }
// }
//
// static bool isTokenExpired(String token) {
//   Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
//   int expiryTime = decodedToken['exp'] * 1000;
//   return DateTime.now().millisecondsSinceEpoch > expiryTime;
// }
}

// class Auth {
//   static const API_URL = 'https://your-api-url.com';
//   //static const SECRET_KEY = 'your-secret-key';
//
//   static Future<String> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString('token');
//     return token;
//   }
//
//   static Future<void> setToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//   }
//
//   static Future<String> getRefreshToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String refreshToken = prefs.getString('refresh_token');
//     return refreshToken;
//   }
//
//   static Future<void> setRefreshToken(String refreshToken) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('refresh_token', refreshToken);
//   }
//
//   static Future<Map<String, String>> getHeaders() async {
//     String token = await getToken();
//     if (token == null) {
//       throw Exception('No token found.');
//     }
//
//     Map<String, String> headers = {'Authorization': 'Bearer $token'};
//
//     return headers;
//   }
//
//   static Future<String> refreshToken() async {
//     String refreshToken = await getRefreshToken();
//     var response = await http.post(Uri.parse('$API_URL/refresh_token'),
//         body: {'refresh_token': refreshToken});
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       String newToken = data["access_token"];
//       await setToken(newToken);
//
//       return newToken;
//     } else {
//       throw Exception('Failed to refresh token');
//     }
//   }
//
//   static bool isTokenExpired(String token) {
//     Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
//     int expiryTime = decodedToken['exp'] * 1000;
//     return DateTime.now().millisecondsSinceEpoch > expiryTime;
//   }
// }

// class ApiClient {
//   static const API_URL = 'https://your-api-url.com';
//
//   static Future<http.Response> get(String path) async {
//     Map<String, String> headers = await Auth.getHeaders();
//
//     var response = await http.get(Uri.parse('$API_URL/$path'), headers: headers);
//
//     if (response.statusCode == 401) {
//       // Token has expired, refresh it and try again
//       String token = await Auth.refreshToken();
//       headers = {'Authorization': 'Bearer $token'};
//
//       response = await http.get(Uri.parse('$API_URL/$path'), headers: headers);
//     } else if (Auth.isTokenExpired(headers['Authorization'])) {
//       // Token has expired since it was last retrieved, refresh it and try again
//       String token = await Auth.refreshToken();
//       headers = {'Authorization': 'Bearer $token'};
//
//       response = await http.get(Uri.parse('$API_URL/$path'), headers: headers);
//     }
//
//     return response;
//   }
//
//   static Future<http.Response> post(String path, {dynamic body}) async {
//     Map<String, String> headers = await Auth.getHeaders();
//
//     var response = await http.post(Uri.parse('$API_URL/$path'),
//         headers: headers, body: jsonEncode(body));
//
//     if (response.statusCode == 401) {
//       // Token has expired, refresh it and try again
//       String token = await Auth.refreshToken();
//       headers = {'Authorization': 'Bearer $token'};
//
//       response = await http.post(Uri.parse('$API_URL/$path'),
//           headers: headers, body: jsonEncode(body));
//     } else if (Auth.isTokenExpired(headers['Authorization'])) {
//       // Token has expired since it was last retrieved, refresh it and try again
//       String token = await Auth.refreshToken();
//       headers = {'Authorization': 'Bearer $token'};
//
//       response = await http.post(Uri.parse('$API_URL/$path'),
//           headers: headers, body: jsonEncode(body));
//     }
//
//     return response;
//   }
// }
