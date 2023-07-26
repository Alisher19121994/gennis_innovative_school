import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../pages/profilePage/model/user_profile.dart';

class ProfileController extends GetxController {
  var isLoading = false;
  UserProfile userProfile = UserProfile();

  void getProfileDate()async{
    isLoading = true;
    update();
    var response = await NetworkService.fetchProfileData(NetworkService.API_profile);
    userProfile = response.user as UserProfile;
    isLoading = false;
    update();
  }
}