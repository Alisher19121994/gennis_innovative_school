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
  final Connectivity _connectivity = Connectivity();
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

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text('PLEASE CONNECT TO THE INTERNET',
              style: TextStyle(color: Colors.black, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
