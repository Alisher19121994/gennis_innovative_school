import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/groups_data.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';
import '../pages/registration/model/login_response.dart';

class NetworkService {
  static String baseUrlAddress = 'http://192.168.1.23:5000';

  /* Http Apis */
  static String API_group_profile = 'api/group_profile';
  static String API_my_groups = 'api/my_groups';
  static String API_make_attendance = 'api/make_attendance';

//   static Future<String?> getNewAccessToken(String api) async {
//     var refreshToken = await SharedPreferenceData.getRefreshToken();
//     final response = await http.post(Uri.parse("$baseUrlAddress/$api"),
//       body: {'refresh_token': refreshToken,},);
//     if (response.statusCode == 200) {
//       return response.body;
//       //     Map<String, dynamic> data = jsonDecode(response.body);
// //     String newToken = data["access_token"];
// //     await setToken(newToken);
// //
// //     return newToken;
//     }
//     return null;
//   }
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
  static Future<UserList> fetchUsersData(String api,int id)async{
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

  static Future GET(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.http(baseUrlAddress, api, params);
    var response = await get(uri, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


  static Future<String?> POST(String api, Map<dynamic, dynamic> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.https(baseUrlAddress, api);
    var response = await post(uri,
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

  static Future<String?> PUT(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.https(baseUrlAddress, api);
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

  static Map<dynamic, dynamic> paramsCreateStudentsAttendance(UserList attendance,Students students) {
    Map<dynamic, dynamic> params = {};
    params.addAll({
      'groupId': attendance.groupID,
      students: {
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
        'regDate': students.regDate,
        'role': students.role,
        "scores": students.scores,
        'surname': students.surname,
        'typeChecked':students.typeChecked,
        'username': students.username,
      }
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
      'isTypeChecked': students.typeChecked.toString(),
      'surname': students.surname.toString(),
      'username': students.username.toString(),
    });
    return params;
  }
}

