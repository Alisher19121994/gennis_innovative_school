import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/registration/model/login_response.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/entarnce_page.dart';
import '../pages/registration/sign_in_page.dart';

class SplashController extends GetxController {
  var isLoading = false;

  Future<void> hasLoggedInByUser() async {
    isLoading = true;
    update();
    var response = await NetworkService.getNewAccessToken();
    print('getNewAccessToken Controller response in Splash: $response');

    if (response != null) {
      dynamic decodedResponse = jsonDecode(response);
      String accessToken = decodedResponse['access_token'];
      SharedPreferenceData.setToken(LoginResponse(data: Data(accessToken: accessToken)));

      print('Controller Yangi token olindi in Splash: $accessToken');
    } else {
      isLoading = false;
      update();
    }
  }

}
