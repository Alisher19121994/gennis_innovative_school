import 'dart:convert';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:gennis_innovative_school/logService/log_service.dart';
import 'package:http/http.dart' as http;
import 'package:instabug_http_client/instabug_http_client.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/groups_data.dart';
import '../pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';
import '../pages/profilePage/model/user_profile.dart';
import '../pages/registration/model/sign_in.dart';

class NetworkService {

  static String baseUrlAddress = 'http://192.168.1.113:5000';
  static final client = InstabugHttpClient();
  static final _chuckerHttpClient = ChuckerHttpClient(http.Client());

  /* Http Api */
  static String API_group_profile = 'api/group_profile';
  static String API_my_groups = 'api/my_groups';
  static String API_profile = 'api/profile';
  static String API_make_attendance = 'api/make_attendance';

  /* HTTP request get New Access Token */
  static Future<dynamic> getNewAccessToken() async {
    var refreshToken = await SharedPreferenceData.getRefreshToken();
    final url = Uri.parse('$baseUrlAddress/api/refresh');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $refreshToken'
    };
    final response = await client.post(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  /* HTTP request  */
  static Future<String?> loginUser(LogIn logIn) async {
    final response = await client.post(
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
        await client.get(Uri.parse('$baseUrlAddress/$api/$id'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final Map<String, dynamic> body = jsonDecode(response.body.toString());
    final UserList userList = UserList.fromJson(body);
    return userList;
  }

  static Future<GroupOfData> fetchGroupData(String api) async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    final response = await client.get(Uri.parse('$baseUrlAddress/$api/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    final Map<String, dynamic> body = jsonDecode(response.body);
    final GroupOfData groupOfData = GroupOfData.fromJson(body);
    return groupOfData;
  }

  static Future<UserProfile> fetchProfileData(String api) async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    final response = await client.get(Uri.parse('$baseUrlAddress/$api/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    final Map<String, dynamic> body = jsonDecode(response.body);
    final UserProfile userProfile = UserProfile.fromJson(body);
    return userProfile;
  }

  static Future<String?> postUsersAttendance(String api, UserList userList, Students students) async {
    String? token = await SharedPreferenceData.getToken();
      var studentList =  {
      'age': 0,
      'attended': "",
      'comment': "",
      "date": {"day": 27, "month": "09"},
      "id": 3,
      'img': "",
      'money': 0,
      'moneyType': "",
      'name': "",
      'phone': "",
      'photoProfile':"",
      "reason": "",
      'reg_date':"",
      'role': "",
      "scores": {},
      'surname': "",
      'typeChecked':"",
      'username': "",
    };
      var requestBody = {
        'groupId': 1,
        'student': studentList,
      };
    var response = await _chuckerHttpClient.post(Uri.parse('$baseUrlAddress/$api'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody)
    );
    if (response.statusCode == 200) {
    //  LogService.warning(response);
      return response.body;
    }
    return null;
  }
  // static Future<String?> postUsersAttendance(String api, Attendance userList ) async {
  //   String? token = await SharedPreferenceData.getToken();
  //     var studentList =  {
  //     'age': userList.student?.age,
  //     'attended': userList.student?.attended,
  //     'comment': userList.student?.comment,
  //     "date": {"day": userList.student?.date?.day, "month": userList.student?.date?.month.toString()},
  //     "id": userList.student?.id,
  //     'img': userList.student?.img,
  //     'money': userList.student?.money,
  //     'moneyType': userList.student?.moneyType,
  //     'name': userList.student?.name,
  //     'phone': userList.student?.phone,
  //     'photoProfile':userList.student?.photoProfile,
  //     "reason": userList.student?.reason,
  //     'reg_date':userList.student?.regDate,
  //     'role': userList.student?.role,
  //     "scores": {},
  //     'surname': userList.student?.surname,
  //     'typeChecked':userList.student?.typeChecked,
  //     'username': userList.student?.username,
  //   };
  //     var requestBody = {
  //       'groupId': userList.groupId,
  //       'student': studentList,
  //     };
  //   var response = await _chuckerHttpClient.post(Uri.parse('$baseUrlAddress/$api'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: jsonEncode(requestBody)
  //   );
  //   if (response.statusCode == 200) {
  //   //  LogService.warning(response);
  //     return response.body;
  //   }
  //   return null;
  // }
  // static Future<String?> postUsersAttendance(String api, UserList userList, Students students) async {
  //   String? token = await SharedPreferenceData.getToken();
  //     var studentList =  {
  //     'age': 18,
  //     'attended': "true",
  //     'comment': "",
  //     "date": {"day": 30, "month": "11"},
  //     "id": 2,
  //     'img': "None",
  //     'money': 3845,
  //     'moneyType': "green",
  //     'name': "Dawdwadawd",
  //     'phone': "23123123",
  //     'photoProfile':"None",
  //     "reason": "",
  //     'reg_date':"2023-05-05",
  //     'role': "a43c33b82",
  //     "scores": {},
  //     'surname': "Sadawdawdsd",
  //     'typeChecked':"no",
  //     'username': "student",
  //   };
  //     var requestBody = {
  //       'groupId': 1,
  //       'student': studentList,
  //     };
  //   var response = await _chuckerHttpClient.post(Uri.parse('$baseUrlAddress/$api'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: jsonEncode(requestBody)
  //   );
  //   if (response.statusCode == 200) {
  //   //  LogService.warning(response);
  //     return response.body;
  //   }
  //   return null;
  // }


}
