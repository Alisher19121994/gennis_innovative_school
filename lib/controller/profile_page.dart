import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/profilePage/model/user_profile.dart';

class ProfileController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isLoading = false;
  UserProfile userProfile = UserProfile();
  final  formKey = GlobalKey<FormState>();
  late String userName;
  late String name;
  late String lastName;
  late String dateOfBirth;
  late String phoneNumber;
  var image = SharedPreferenceData.getImageURL();

  void getProfileDate()async{
    isLoading = true;
    update();
    var response = await NetworkService.fetchProfileData(NetworkService.API_profile);
    userProfile = response.user as UserProfile;
    isLoading = false;
    update();
  }
}