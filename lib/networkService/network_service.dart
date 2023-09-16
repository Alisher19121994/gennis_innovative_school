import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../globalModel/create_new_users.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/group_info.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';
import '../pages/profilePage/model/user_profile.dart';
import '../pages/registration/model/sign_in.dart';

class NetworkService {

  static String baseUrlAddress = 'https://gennis.uz';
  static String URL = 'gennis.uz';
  static Map<String,String> header = {'Content-Type':'application/json; charset=UTF-8'};
  static Dio _dio = Dio();
  /* Http Api */
  static String API_group_profile = 'api/group_profile';
  static String API_my_groups = 'api/my_groups';
  static String API_profile = 'api/profile';
  static String API_make_attendance = 'api/make_attendance';

  /* HTTP request */

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

  static Future<dynamic> logoutOfUser() async {
    var token = await SharedPreferenceData.getToken();
    final url = Uri.parse('$baseUrlAddress/api/logout');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token'
    };
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

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
    final response = await http.get(Uri.parse('$baseUrlAddress/$api/$id'),
            headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final UserList userList = UserList.fromJson(jsonDecode(response.body.toString()));
    SharedPreferenceData.setGroupId(userList);
    return userList;
  }


  static Future<String?> GET(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.http(URL, api, params); // http or https
    var response = await get(
        uri,
        headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    String? token = await SharedPreferenceData.getToken();
    var uri = Uri.https(URL, api); // http or https
    var response = await post(
        uri,
        headers:  {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static GroupInfo groupInfoParam(String response) {
    Map<String, dynamic> body =  jsonDecode(response);
    final GroupInfo groupOfData = GroupInfo.fromJson(body);
    return groupOfData;
  }


  // static List<GroupsInfo> parsePostList(String response){
  //   dynamic json = jsonDecode(response);
  //   var data = List<GroupsInfo>.from(json.map((x) => GroupsInfo.fromJson(x)));
  //   return data;
  // }




  static Future<GroupInfo> fetchGroupData(String api) async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
     Map<String, dynamic> body = {};
    try{
      var response = await http.get(
          Uri.parse('$baseUrlAddress/$api/$id'),
          headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          }
          );
      if(response.statusCode == 200) {
        body = jsonDecode(response.body.toString());
      }
    }catch(e){
      print('XATOLIK: $e');
    }
    final GroupInfo groupOfData = GroupInfo.fromJson(body);
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
    //SharedPreferenceData.setImageURL(UserProfile(user: User(photoProfile: userProfile.user?.photoProfile??'')));
    return userProfile;
  }

  static Future<String?> postUsersAttendances(String api, Attendance attendance) async {
    String? token = await SharedPreferenceData.getToken();
    _dio = Dio(BaseOptions(headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    }));

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
   var response = await _dio.post('$baseUrlAddress/$api', data: requestBody);
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
    var response = await http.post(Uri.parse('$baseUrlAddress/$api'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody));
    if (response.statusCode == 200) {
      print(response);
      return response.body;
    }
    return null;
  }

  static Future<String?> postAllUsers(String api, CreateAttendances createAttendance) async {
    String? token = await SharedPreferenceData.getToken();
    List<NewScores>? scores = [];

    Map<String,dynamic> request={};
    for(var listOfUser in scores){
      request.addAll( {
        "activeStars": listOfUser.activeStars,
        "id": listOfUser.id,
        "name": listOfUser.name,
        //"stars": listOfUser.stars,
        "stars": List.generate(5, (index) => {"active": true}),
        "title": listOfUser.title
      });
    }
    print(request);
    Map<String,dynamic> studentList = {};
    studentList.addAll({
      'active': createAttendance.student?.active,
      'checked':createAttendance.student?.checked,
      "date": {"day": createAttendance.student?.date?.day, "month": createAttendance.student?.date?.month},
      "id": createAttendance.student?.id,
      'money': createAttendance.student?.money,
      'moneyType': createAttendance.student?.moneyType,
      'name': createAttendance.student?.name,
      'profilePhoto':createAttendance.student?.profilePhoto,
      "requestMsg": createAttendance.student?.requestMsg,
      'requestType':createAttendance.student?.requestType,
      "scores": request,
      'surname': createAttendance.student?.surname,
      'typeChecked':createAttendance.student?.typeChecked,
    });
    Map<String,dynamic> requestBody={};
    requestBody.addAll({
      'groupId':createAttendance.groupId,
      'student': studentList,
    });
    print(requestBody);
    var response = await http.post(Uri.parse('$baseUrlAddress/$api'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody));
    if (response.statusCode == 200) {
      print(response);
      return response.body;
    }
    return null;
  }

}
