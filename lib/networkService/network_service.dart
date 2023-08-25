import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:http/http.dart' as http;
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/group_info.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';
import '../pages/profilePage/model/user_profile.dart';
import '../pages/registration/model/sign_in.dart';

class NetworkService {

  //static String baseUrlAddress = 'http://192.168.1.28:5002';
  static String baseUrlAddress = 'https://gennis.uz';
  static Dio _dio = Dio();
  /* Http Api */
  static String API_group_profile = 'api/group_profile';
  static String API_my_groups = 'api/my_groups';
  static String API_profile = 'api/profile';
  static String API_make_attendance = 'api/make_attendance';
  static String API_make_attendanceNEW = '/api/make_attendance';

  /* HTTP request get New Access Token */

  static Future<dynamic> refreshAccessToken(String refreshToken)async {
    var refreshToken = await SharedPreferenceData.getRefreshToken();
      _dio = Dio(BaseOptions(headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $refreshToken',
      }));
    final response = await _dio.post('$baseUrlAddress/api/refresh');
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  static Future<dynamic> getNewAccessToken() async {
    var refreshToken = await SharedPreferenceData.getRefreshToken();

    final url = Uri.parse('$baseUrlAddress/api/refresh');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $refreshToken'
    };
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  /* HTTP request  */
  static Future<String?> loginUser(LogIn logIn) async {
    final response = await http.post(
      Uri.parse('$baseUrlAddress/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': logIn.username,
        'password': logIn.password,
      }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<UserList?> fetchUsersData(String api, int id) async {
    var token = await SharedPreferenceData.getToken();
    final response =
        await http.get(Uri.parse('$baseUrlAddress/$api/$id'),
            headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final Map<String, dynamic> body = jsonDecode(response.body.toString());
    final UserList userList = UserList.fromJson(body);
    SharedPreferenceData.setGroupId(userList);
    return userList;
  }

  static Future<GroupInfo> fetchGroupData(String api) async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    var response = await http.get(Uri.parse('$baseUrlAddress/$api/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    final GroupInfo groupOfData = GroupInfo.fromJson(jsonDecode(response.body));
    return groupOfData;
  }

  static Future<UserProfile> fetchProfileData(String api) async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();

    final response = await http.get(Uri.parse('$baseUrlAddress/$api/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    final Map<String, dynamic> body = jsonDecode(response.body);
    final UserProfile userProfile = UserProfile.fromJson(body);
    SharedPreferenceData.setImageURL(userProfile.user!.photoProfile!);
    return userProfile;
  }

  static Future<String?> postUsersAttendances(String api, UserList userList) async {

    String? token = await SharedPreferenceData.getToken();
    _dio = Dio(BaseOptions(headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    }));
   var response = await _dio.post('$baseUrlAddress/$api', data: jsonEncode(userList.toJson()),);
    print('headers: ${response.headers}');
    print('.requestOptions.data: ${response.requestOptions.data}');
    print('.requestOptions.method: ${response.requestOptions.method}');
    print('extra: ${response.extra}');

    if (kDebugMode) {
      print("NetworkService: $response");
    }

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  static Future<String?> postAllUser(String api, Attendance attendance) async {
    String? token = await SharedPreferenceData.getToken();
    Map<String,dynamic> studentList = {};
       studentList.addAll({
         'age': attendance.student?.age,
         'attended':attendance.student?.attended,
         'comment':attendance.student?.comment,
         "date": {"day": attendance.student?.date?.day, "month": attendance.student?.date?.month.toString()},
         "id": attendance.student?.id,
         'img': attendance.student?.img,
         'money': attendance.student?.money,
         'moneyType': attendance.student?.moneyType,
         'name': attendance.student?.name,
         'phone': attendance.student?.phone,
         'photoProfile':attendance.student?.photoProfile,
         "reason": attendance.student?.reason,
         'reg_date':attendance.student?.regDate,
         'role': attendance.student?.role,
         "scores": {},
         'surname': attendance.student?.surname,
         'typeChecked':attendance.student?.typeChecked,
         'username': attendance.student?.username,
       });
    Map<String,dynamic> requestBody={};
    requestBody.addAll({
      'groupId':attendance.groupId,
      'student': studentList,
    });
    print(requestBody);
    print("userList.groupID in service: ${attendance.groupId}");
    var response = await http.post(Uri.parse('$baseUrlAddress/$api'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody));
    // // Print request details
    // print('Request: ${response.request}');
    // print('Request method: ${response.request!.method}');
    // print('Request URL: ${response.request!.url}');
    // print('Request headers: ${response.request!.headers}');
    //
    // // Print response details
    // print('Response status code: ${response.statusCode}');
    // print('Response headers: ${response.headers}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print(response);
      return response.body;
    }
    return null;
  }
}
