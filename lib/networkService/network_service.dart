import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/groups_data.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';
import '../pages/profilePage/model/user_profile.dart';

class NetworkService {
  static String baseUrlAddress = 'http://192.168.1.10:5000';

  /* Http Apis */
  static String API_attendances = 'api/attendances';
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
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
  }
  /* HTTP request  */
  static Future<UserList?> fetchUsersData(String api,int id)async{
    var token = await SharedPreferenceData.getToken();
    final response = await http.get(Uri.parse('$baseUrlAddress/$api/$id'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final Map<String,dynamic> body = jsonDecode(response.body.toString());
    final UserList userList = UserList.fromJson(body);
    return userList;
  }

  static Future<GroupOfData>fetchGroupData(String api)async{
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    final response = await http.get(
        Uri.parse('$baseUrlAddress/$api/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }
    );
    final Map<String,dynamic> body = jsonDecode(response.body);
    final GroupOfData groupOfData = GroupOfData.fromJson(body);
    return groupOfData;
  }

  static Future<UserProfile>fetchProfileData(String api)async{
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    final response = await http.get(
        Uri.parse('$baseUrlAddress/$api/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }
    );
    final Map<String,dynamic> body = jsonDecode(response.body);
    final UserProfile userProfile = UserProfile.fromJson(body);
    return userProfile;
  }

  static Future<String?> postUsersAttendance(String api,UserList userList, Students students) async {
    String? token = await SharedPreferenceData.getToken();
    var response = await post(Uri.parse('$baseUrlAddress/$api'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
            'groupId': userList.groupID,
              userList.data?.students: {
              'age': students.age,
              'attended':students.attended,
              'comment': students.comment,
              "date": {"day": students.date?.day, "month": students.date?.month},
              "id": students.id,
              'img': students.img,
              'money': students.money,
              'moneyType':students.moneyType,
              'name': students.name,
              'phone': students.phone,
              'photoProfile':students.photoProfile,
              "reason": students.reason,
              'reg_date': students.regDate,
              'role': students.role,
              "scores": students.scores,
              'surname': students.surname,
              'typeChecked':students.typeChecked,
              'username': students.username,
            }
          }
        ));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.https(baseUrlAddress, api, params);
    var response = await delete(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

}

