import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  var isLoading = false;
  List<StudentsData> listOfStudents = [];
  UserList userList = UserList();
  Information information = Information();

  Future<void> apiUserListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    listOfStudents = response?.data!.students as List<StudentsData>;
    isLoading = false;
    update();
  }

  Future<void> apiUserListOfTeacher(int id) async {
    isLoading = true;
    update();
    UserList? response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    userList = response!;
    isLoading = false;
    update();
  }

}
