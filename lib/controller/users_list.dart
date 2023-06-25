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
    // if(students.money! > 0 ){
    //   isPaid = true;
    //   update();
    // }else{
    // //   isPaid = false;
    // //   update();
    // // }
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    listOfStudents = response.data!.students!;
     // if (response != null) {
     //   listOfStudents  = NetworkService.parseUserList(response) as List<Students>;
     // // listOfStudents = List.from(response).map((e) => Da);
     //   update();
     // } else {
     //   listOfStudents = [];
     //   update();
     // }
    isLoading = false;
    update();
  }
}
