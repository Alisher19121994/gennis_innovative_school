import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import '../pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:http/http.dart' as http;

class CreateController extends GetxController {
  var isLoading = false;
  var isChecked = false;
  int index = 0;
  List<int> listOfDay = [];
  List<String> listOfMonth = [];
  List<Students> listOfStudents = [];
  Students students = Students();
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
    var response = await NetworkService.postUsersAttendance(NetworkService.API_make_attendance, userAttendance,students);
    if (response != null) {
    } else {
      isLoading = false;
      update();
    }}

  void monthOfDate(){
    for (var i = 0; i < 12; i++) {
      var monthNumber = (DateTime.now().month - i);
      var month = (monthNumber < 1 ? 12 - (-monthNumber) : monthNumber);
      listOfMonth.add(month.toString());
    }
  }
  void dayOfDate(){
    for (var i = 0; i < 31; i++) {
      var dayNumber = (DateTime.now().day - i);
      var day = (dayNumber < 1 ? 31 - (-dayNumber) : dayNumber);
      listOfDay.add(day);
    }
  }

  months(){
    // List months = [];
    // for (var i = 0; i < 12; i++) {
    //   var monthNumber = (DateTime.now().month - i);
    //   var monthDate = DateFormat.M().parse(
    //       (monthNumber < 1 ? 12 - (-monthNumber) : monthNumber).toString());
    //   var year = DateTime.now().month - i < 1
    //       ? DateTime.now().year - 1
    //       : DateTime.now().year;
    //   var month = DateFormat.MMMM().format(monthDate);
    //   months.add('$year $month');
    // }
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    DateTime now = DateTime.now();
    print(months);
    var result=(months..addAll(months.getRange(0, now.month))..removeRange(0,now.month)).reversed.toList();
    print(result);
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
