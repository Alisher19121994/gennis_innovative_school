import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

import '../network/sharedPreferenceData/shared_preference_data.dart';

class UserListController extends GetxController {
  var isLoading = false;
  var isPaid = false;
  List<StudentsData> listOfStudents = [];
  UserList userList = UserList();

  void apiUserListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    listOfStudents = response?.data!.students as List<StudentsData>;
    isLoading = false;
    update();
  }

}
