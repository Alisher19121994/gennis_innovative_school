import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

import '../logService/log_service.dart';

class CreateController extends GetxController {
  var isLoading = false;
  List<Students> listOfStudents = [];
  Students students = Students();
  UserList userList = UserList();


  void apiCreateListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.GET(NetworkService.API_group_profile+id.toString(), NetworkService.paramsEmpty());
    if (response != null) {
      //LogService.w(response as String);
     // listOfStudents = userList.data!.students!;
      listOfStudents = NetworkService.parseUserList(response as String) as List<Students>;
      update();
    } else {
      listOfStudents = [];
      update();
    }
    isLoading = false;
    update();
  }
}
