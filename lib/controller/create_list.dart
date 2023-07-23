import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

import '../pages/mainSceen/pages/attendanceList/attendance_list.dart';
//import 'package:http/http.dart' as http;

class CreateController extends GetxController {
  var isLoading = false;
  var isChecked = false;
  int index = 0;
  var response;
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
    listOfStudents = response?.data?.students as List<Students>;
    update();
    isLoading = false;
    update();
  }

  void apiPostOfStudentsAttendance(UserList userAttendance) async {
    isLoading = true;
    update();
    response = await NetworkService.PostUsersAttendance(
        NetworkService.API_make_attendance, userAttendance);
    if (response != null) {
    } else {
      isLoading = false;
      update();
    }
  }

  void toggleStudentSelection() {
    isChecked = !isChecked;
    update();
  }

  finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //Navigator.pop(context, "result");
      Get.to(const AttendanceList(ids: 0));
    });
  }
}
