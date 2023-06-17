import 'dart:convert';

import 'package:gennis_innovative_school/logService/log_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';

class NetworkService {
  static String baseUrl = '176.96.243.55';

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${SharedPreferenceData.getToken()}',
  };

  /* Http Apis */
  static String API_group_profile = '/api/group_profile/';

  /* HTTP request  */
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(baseUrl, api, params);
    var response = await get(uri, headers: headers,);
    if (response.statusCode == 200) {
      LogService.e(response.body);
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
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
    var logger = Logger();
    // dynamic json = jsonDecode(response);
    // var data = List<UserList>.from(json.map((info) => UserList.fromJson(info)));
      final Map<String,dynamic> body = jsonDecode(response);
      final UserList userList = UserList.fromJson(body);
      LogService.w(body as String);
      logger.w(body);
    return userList;
  }
}
