import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

import '../logService/log_service.dart';

class UserListController extends GetxController {
  var isLoading = false;
  var isPaid = false;
  List<Students> listOfStudents = [];
  Students students = Students();
  UserList userList = UserList();


  void apiListOfStudents(int id) async {
    // if(students.money! > 0 ){
    //   isPaid = true;
    //   update();
    // }else{
    //   isPaid = false;
    //   update();
    // }
    isLoading = true;
    update();
    var response = await NetworkService.GET(
        NetworkService.API_group_profile+id.toString(), NetworkService.paramsEmpty());
    if (response != null) {
      LogService.w(response);
      listOfStudents = NetworkService.parseUserList(response) as List<Students>;
      update();
    } else {
      listOfStudents = [];
      update();
    }
    isLoading = false;
    update();
  }
}
