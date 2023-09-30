import 'package:flutter/foundation.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/group_info.dart';
import '../pages/profilePage/model/user_profile.dart';

class ProfileController extends GetxController {
  var isLoading = false;
  UserProfile userProfile = UserProfile();
  List<GroupsInfo> listOfGroups = [];
  GroupsInfo groupsInfo = GroupsInfo();

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

    Future<void> logout() async {
      isLoading = true;
      update();
      var response = await NetworkService.logoutOfUser();
      if (response != null) {
        if (kDebugMode) {
          print('logoutOfUser: $response');
        }
        isLoading = false;
        update();
      }
    }
  }




