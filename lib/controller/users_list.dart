import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/registration/model/login_response.dart';

class UserListController extends GetxController {
  var isLoading = false;
  List<StudentsData> listOfStudents = [];
  UserList userList = UserList();
  Information information = Information();
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();


  Future<void> apiUserListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(id);
    listOfStudents = response?.data!.students as List<StudentsData>;
    isLoading = false;
    update();
  }

  Future<void> apiUserListOfTeacher(int id) async {
    isLoading = true;
    update();
    UserList? response = await NetworkService.fetchUsersData(id);
    userList = response!;
    isLoading = false;
    update();
  }

  Future<void> refreshUsersList() async {
    isLoading = true;
    update();
    var response = await NetworkService.getNewAccessToken();
    print('getNewAccessToken Controller response in refreshUsersList: $response');
    if (response != null) {
      dynamic decodedResponse = jsonDecode(response);
      String accessToken = decodedResponse['access_token'];
      SharedPreferenceData.setToken(LoginResponse(data: Data(accessToken: accessToken)));
      print('Controller Yangi token olindi in refreshUsersList: $accessToken');
    } else {
      isLoading = false;
      update();
    }
  }

}
