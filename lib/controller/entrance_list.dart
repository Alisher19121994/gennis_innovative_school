import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/group_info.dart';
import '../pages/profilePage/model/user_profile.dart';
import '../pages/registration/model/login_response.dart';

class EntranceController extends GetxController {
  int? index;
  var isLoading = false;
  List<GroupsInfo> listOfGroups = [];
  GroupInfo groupOfData = GroupInfo();
  GroupsInfo groupsOfData = GroupsInfo();
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;
  UserProfile userProfile = UserProfile();

  Future<void> getProfileDate() async {
    isLoading = true;
    update();
    UserProfile response = await NetworkService.fetchProfileData();
    userProfile = response;
    if (kDebugMode) {
      print(response);
    }
    isLoading = false;
    update();
  }

  checkInternet(BuildContext context) async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      dialogBuilder(context);
    }
  }

  Future<void> dialogBuilder(BuildContext context) {
    return Dialogs.materialDialog(
        barrierDismissible: false,
        color: Colors.red,
        msg: 'Please, connect to the internet',
        title: 'ERROR',
        customViewPosition: CustomViewPosition.BEFORE_ACTION,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              checkInternet(context);
              Navigator.of(context).pop();
            },
            text: 'Try again',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  startStreaming(BuildContext context) async {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkInternet(context);
    });
  }

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
    print('getNewAccessToken EntranceController: $response');
    if (response != null) {
      dynamic decodedResponse = jsonDecode(response);
      String accessToken = decodedResponse['access_token'];
      SharedPreferenceData.setToken(LoginResponse(data: Data(accessToken: accessToken)));
      print('Controller Yangi token olindi EntranceController: $accessToken');
    } else {
      isLoading = false;
      update();
    }
  }

}
