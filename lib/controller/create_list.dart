import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;

class CreateController extends GetxController {
  var isLoading = false;
  var isChecked = false;
  List<Students> listOfStudents = [];
  Date day = Date();
  Date month = Date();
  Students? students;
  UserList userList = UserList();

  void apiCreateListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(
        NetworkService.API_group_profile, id);
    listOfStudents = response.data!.students!;
    update();
    isLoading = false;
    update();

  }

  void apiPostOfStudentsAttendance(Students students) async {
    isLoading = true;
    update();
    var response = await NetworkService.POST(NetworkService.API_make_attendance,
        NetworkService.paramsCreateStudentsAttendance(userList, students));
    if (response != null) {
    } else {
      isLoading = false;
      update();
    }
  }

  void toggleStudentSelection(Students student) {
   // isChecked == false;
    // update();
    // if (isChecked) {
    //   student.typeChecked == 'no';
    //   update();
    // } else {
    //   student.typeChecked == 'yes';
    //   update();
    // }
    // return isChecked;

    if(student.typeChecked == 'no'){
      listOfStudents = (student.typeChecked == 'no') as List<Students>;
      update();
    }else{
      listOfStudents = (student.typeChecked == 'yes') as List<Students>;
      update();
    }
  }
}
