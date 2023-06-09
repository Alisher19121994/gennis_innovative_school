import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

class PointListController extends GetxController {
  var isLoading = false;
  var isPaid = false;
  List<Students> listOfStudents = [];
  Students students = Students();
  UserList userList = UserList();


  void apiPointListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    listOfStudents = response.data!.students!;
    isLoading = false;
    update();

  }


}
