import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gennis_innovative_school/logService/log_service.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateController extends GetxController {
  final Connectivity connectivity = Connectivity();
  int isSelected = 0;
  bool isChosen = true;
  //int value = 0;
  int index = 0;
  var isLoading = false;
  List<int> listOfDay = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
  List<String> listOfMonth = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  List<StudentsData> listOfStudents = [];
  UserList userList = UserList();
  Attendance attendance = Attendance();

  void apiCreateListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile, id);
    listOfStudents = response?.data?.students as List<StudentsData>;
    update();
    isLoading = false;
    update();
  }

  void apiPostOfStudentsAttendance(Attendance userLists) async {
    isLoading = true;
    update();
    var response = await NetworkService.postAllUser(NetworkService.API_make_attendance,userLists);
    if (response != null) {
      if (kDebugMode) {
        print("CreateController: $response");
      }
      isLoading = false;
      update();
    }}

  void toggleStudentSelection(bool? selected,int indexes) {
  if(selected == true){
    listOfStudents[indexes].typeChecked = 'yes';
    print(listOfStudents[indexes].typeChecked = 'yes');
    update();
  }else{
    listOfStudents[indexes].typeChecked = 'no';
    print(listOfStudents[indexes].typeChecked = 'no');
    update();
  }
  }

  finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //Navigator.pushNamed(context, AttendanceList.id);
      //Get.to(const AttendanceList(ids: 0));
    });
  }

}

