import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gennis_innovative_school/logService/log_service.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import '../pages/mainSceen/pages/createList/model/user_data.dart';

class CreateController extends GetxController {
  final Connectivity connectivity = Connectivity();
  var isLoading = false;
  int index = 0;
  List<int> listOfDay = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
  List<String> listOfMonth = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  int? selectedDay;
  String? selectedMonth;
  List<Students> listOfStudents = [];
  List<Students> listCreatedStudents = [];
  Students students = Students();
  Attendance attendance = Attendance();
  UserList userList = UserList();

  void apiCreateListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile, id);
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
      //LogService.warning(response);
      print("postUsersAttendance: $response");
    } else{
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

  @override
  void onInit() {
    super.onInit();
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }
  void updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text('PLEASE CONNECT TO THE INTERNET', style: TextStyle(color: Colors.black, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}

