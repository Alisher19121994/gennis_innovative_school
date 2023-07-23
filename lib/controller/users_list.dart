import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  var isLoading = false;
  var isPaid = false;
  List<Students> listOfStudents = [];
//  Students students = Students();
 late Students students;
  UserList userList = UserList();


  void apiUserListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_attendances,id);
    listOfStudents = response?.data!.students as List<Students>;
    isLoading = false;
    update();

    // if(students.money! > 0 ){
    //   isPaid = true;
    //   update();
    // }else{
    //   isPaid = false;
    //   update();
    // }
  }


}
