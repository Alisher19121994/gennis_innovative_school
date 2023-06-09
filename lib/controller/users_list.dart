import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  var isLoading = false;
  var isPaid = false;
  List<Students> listOfStudents = [];
  Students students = Students();
  UserList userList = UserList();


  void apiUserListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    listOfStudents = response.data!.students!;
    isLoading = false;
    update();

    if(students.money! > 0 ){
      isPaid = true;
      update();
    }else{
      isPaid = false;
      update();
    }
  }


}
