import 'dart:convert';
//import 'dart:html';
import 'package:dio/dio.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../globalModel/create_new_users.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/group_info.dart';
import '../pages/mainSceen/pages/attendanceList/model/lesson_plan_get.dart';
import '../pages/mainSceen/pages/attendanceList/model/lesson_plan_post.dart';
import '../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';
import '../pages/mainSceen/pages/usersList/model/users.dart';
import '../pages/profilePage/model/user_profile.dart';
import '../pages/profilePage/morePage/model/profile_details_post.dart';
import '../pages/registration/model/sign_in.dart';

class NetworkService {

  static String baseUrlAddress = 'https://gennis.uz';
  static String URL = 'gennis.uz';
  /* HTTP request */

  static Future<dynamic> getNewAccessToken() async {
    var refreshToken = await SharedPreferenceData.getRefreshToken();
    final url = Uri.parse('https://gennis.uz/api/refresh');
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
    final response = await http.post(Uri.parse('https://gennis.uz/api/logout'),
        headers:  {
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  static Future<String?> loginUser(LogIn logIn) async {
    final response = await http.post(
      Uri.parse('https://gennis.uz/api/login'),
      headers: {'Content-Type':'application/json; charset=UTF-8'},
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

  static Future<UserList?> fetchUsersData(int id) async {
    var token = await SharedPreferenceData.getToken();
    final response = await http.get(
        Uri.parse('https://gennis.uz/api/group_profile/$id'),
            headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final UserList userList = UserList.fromJson(jsonDecode(response.body.toString()));
    SharedPreferenceData.setGroupId(userList);
    return userList;
  }

  static Future<GroupInfo?> GET() async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    var uri = Uri.https('gennis.uz/api/my_groups/$id');
    var response = await get(uri,
        headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      final GroupInfo groupOfData = GroupInfo.fromJson(body);
      return groupOfData;
    }
    return null;
  }
  //
  // static Future<String?> POST(String api, Map<String, String> params) async {
  //   String? token = await SharedPreferenceData.getToken();
  //   var uri = Uri.https(URL, api); // http or https
  //   var response = await post(
  //       uri,
  //       headers:  {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   },body: jsonEncode(params));
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return response.body;
  //   }
  //   return null;
  // }
  //
  // static Map<String, String> paramsEmpty() {
  //   Map<String, String> params = {};
  //   return params;
  // }

  static GroupInfo groupInfoParam(String response) {
    Map<String, dynamic> body =  jsonDecode(response);
    //dynamic body =  jsonDecode(response);
    final GroupInfo groupOfData = GroupInfo.fromJson(body);
    return groupOfData;
  }

  static Future<http.StreamedResponse > createImage(XFile? data) async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    http.MultipartRequest request = http.MultipartRequest('POST',
        Uri.parse('https://gennis.uz/api/update_photo_profile/$id'));
    request.headers.addAll(<String, String> {
     'Content-Type': 'application/json; charset=UTF-8',
     'Authorization': 'Bearer $token',
   });
    if(GetPlatform.isMobile && data != null){
      File file = File(data.path);
      request.files.add(http.MultipartFile('image',file.readAsBytes().asStream(),file.lengthSync(),
      filename: file.path.split('/').last));
    }
    http.StreamedResponse response = await request.send();
    return response;
  }

  static Future<GroupInfo> fetchGroup() async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    Map<String, dynamic> body = {};
    try{
      var response = await http.get(
          Uri.parse('https://gennis.uz/api/my_groups/$id'),
          headers:{
            "content-type": "application/json; charset=utf-8",
            'authorization':'Bearer $token',
          }
      );
      print('fetchGroup in the api(my_groups): ${response.body}');
      print('response.headers: ${response.headers}');
      if(response.statusCode == 200) {
        body = jsonDecode(response.body.toString().replaceAll("\n",""));
      }
    }catch(e){
      print('XATOLIK: $e');
    }
    final GroupInfo groupOfData = GroupInfo.fromJson(body);
    return groupOfData;
  }

  static Future<LessonPlanList> fetchLessonPlanList(int id) async {
    String? token = await SharedPreferenceData.getToken();
    Map<String, dynamic> body = {};
    try{
      var response = await http.get(
          Uri.parse('https://gennis.uz/api/lesson_plan_list/$id'),
          headers:{
            "content-type": "application/json; charset=utf-8",
            'authorization':'Bearer $token',
          }
      );
      print('fetchLessonPlanList in the api(lesson_plan_list): ${response.body}');
      print('fetchLessonPlanList -> response.headers: ${response.headers}');
      if(response.statusCode == 200) {
        body = jsonDecode(response.body.toString());
      }
    }catch(e){
      print('XATOLIK: $e');
    }
    final LessonPlanList lessonPlanList = LessonPlanList.fromJson(body);
    return lessonPlanList;
  }

  static Future<LessonPlanGet> fetchLessonPlanAllList(int id) async {
    String? token = await SharedPreferenceData.getToken();
    Map<String, dynamic> body = {};
    try{
      var response = await http.get(
          Uri.parse('https://gennis.uz/api/lesson_plan/$id'),
          headers:{
            "content-type": "application/json; charset=utf-8",
            'authorization':'Bearer $token',
          }
      );
      print('fetchLessonPlanAllList in the api(lesson_plan_list) edu page: ${response.body}');
      print('fetchLessonPlanList -> response.headers: ${response.headers}');
      if(response.statusCode == 200) {
        body = jsonDecode(response.body.toString());
      }
    }catch(e){
      print('XATOLIK: $e');
    }
    final LessonPlanGet lessonPlanGet = LessonPlanGet.fromJson(body);
    return lessonPlanGet;
  }

  static Future<String?> postLessonPlan(int id,LessonPlanPost lessonPlanPost) async {
    String? token = await SharedPreferenceData.getToken();
    Map<String,dynamic> lessonPlan = {};
    lessonPlan.addAll({
      "lesson_name": lessonPlanPost.lessonPlan?.lessonName,
      "lesson_target": lessonPlanPost.lessonPlan?.lessonTarget,
      "assessment": lessonPlanPost.lessonPlan?.assessment,
      "main_lesson": lessonPlanPost.lessonPlan?.mainLesson,
      "new_homework": lessonPlanPost.lessonPlan?.newHomework
    });
    print(lessonPlan);
    var response = await http.post(Uri.parse('https://gennis.uz/api/lesson_plan/$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(lessonPlan));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> postProfileDetails(ProfileDetailsPost profileDetailsPost) async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    Map<String,dynamic> postProfileDetails = {};
    postProfileDetails.addAll({
      "birthDay": profileDetailsPost.birthDay,
      "birthMonth": profileDetailsPost.birthMonth,
      "birthYear": profileDetailsPost.birthYear,
      "fatherName": profileDetailsPost.fatherName,
      "name": profileDetailsPost.name,
      "phone": profileDetailsPost.phone,
      "role": profileDetailsPost.role,
      "selectedSubjects": {},
      "surname": profileDetailsPost.surname,
      "type": profileDetailsPost.type,
      "username": profileDetailsPost.username
    });
    print('NetworkService: $postProfileDetails');
    var response = await http.post(Uri.parse('https://gennis.uz/api/change_student_info/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(postProfileDetails));
    print('NetworkService response: $response');
    print('NetworkService response.headers: ${response.headers}');
    print('NetworkService response.statusCode: ${response.statusCode}');
    print('NetworkService response.body: ${response.body}');
    print('NetworkService response.request: ${response.request}');
    print('NetworkService response.reasonPhrase: ${response.reasonPhrase}');
    print('NetworkService response.persistentConnection: ${response.persistentConnection}');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static List<GroupsInfo> parseJsonList(String jsonStr) {
    final List<GroupsInfo> jsonList = json.decode(jsonStr);
    return jsonList.map((json) => GroupsInfo.fromJson(json as Map<String, dynamic>)).toList();
  }

  static Future<UserProfile> fetchProfileData() async {
    String? token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();

    final response = await http.get(Uri.parse('https://www.gennis.uz/api/profile/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });

    final Map<String, dynamic> body = jsonDecode(response.body);
    final UserProfile userProfile = UserProfile.fromJson(body);
    //SharedPreferenceData.setImageURL(UserProfile(user: User(photoProfile: userProfile.user?.photoProfile??'')));
    return userProfile;
  }

  static Future<String?> postAllUsers(CreateAttendances createAttendance) async {
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
    var response = await http.post(Uri.parse('https://gennis.uz/api/make_attendance'),
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


