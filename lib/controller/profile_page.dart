import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../pages/profilePage/model/user_profile.dart';

class ProfileController extends GetxController {
  var isLoading = false;
  UserProfile userProfile = UserProfile();
  final formKey = GlobalKey<FormState>();
  late String userName;
  late String name;
  late String lastName;
  late String dateOfBirth;
  late String phoneNumber;

  void getProfileDate() async {
    isLoading = true;
    update();
    UserProfile response = await NetworkService.fetchProfileData(NetworkService.API_profile);
    userProfile = response;
    if (kDebugMode) {
      print(response);
    }
    isLoading = false;
    update();
  }

  void logout() async {
    isLoading = true;
    update();
    var response = await NetworkService.logoutOfUser();
    if (response != null) {
      isLoading = false;
      update();
    }
  }
}
