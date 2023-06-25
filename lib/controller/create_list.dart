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
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile, id);
    listOfStudents =  response.data!.students!;
    update();
    isLoading = false;
    update();
    //
    // if(students.isTypeChecked = true){
    //   listOfStudents = (students.isTypeChecked = true) as List<Students>;
    //   update();
    // }else{
    //   listOfStudents = (students.isTypeChecked = false) as List<Students>;
    //   update();
    // }
  }
}
