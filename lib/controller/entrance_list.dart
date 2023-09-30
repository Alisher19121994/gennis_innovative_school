import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/group_info.dart';
import '../pages/profilePage/model/user_profile.dart';
import '../pages/registration/model/login_response.dart';

class EntranceController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isLoading = false;
  List<GroupsInfo> listOfGroups = [];
  GroupInfo groupOfData = GroupInfo();
  GroupsInfo groupsOfData = GroupsInfo();
  UserProfile userProfile = UserProfile();
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();


  Future<void> apiEntranceOfGroups() async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchGroup();
    if (kDebugMode) {
      print(response);
    }
    listOfGroups = response.groups ?? [];
    update();
    isLoading = false;
    update();

  }

   Future<void> refreshInEntrance() async {
    isLoading = true;
    update();
    var response = await NetworkService.getNewAccessToken();
    print('getNewAccessToken Controller response in refreshInEntrance: $response');
    if (response != null) {
      dynamic decodedResponse = jsonDecode(response);
      String accessToken = decodedResponse['access_token'];
      SharedPreferenceData.setToken(LoginResponse(data: Data(accessToken: accessToken)));
      print('Controller Yangi token olindi in refreshInEntrance: $accessToken');
    } else {
      isLoading = false;
      update();
    }
  }

}
