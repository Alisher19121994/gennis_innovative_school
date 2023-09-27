

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';

import '../globalModel/create_new_users.dart';

class CreateController extends GetxController {
  final Connectivity connectivity = Connectivity();
  int? selectedDay;
  String? selectedMonth;
  int isSelected = 1;
  int rating = 0;
  var isLoading = false;
  List<int> listOfDay = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
  List<String> listOfMonth = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  List<StudentsData> listOfStudents = [];
  UserList userList = UserList();
  Attendance attendance = Attendance();
  List<NewScores>? scoreOfList=[];


  Future<void> apiCreateListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(id);
    listOfStudents = response?.data?.students as List<StudentsData>;
    update();
    isLoading = false;
    update();
  }

  Future<void> apiPostOfStudentsAttendance(CreateAttendances userLists) async {
    isLoading = true;
    update();
     var response = await NetworkService.postAllUsers(userLists);
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      isLoading = false;
      update();
    }
  }

  Future<void> toggleStudentSelection(bool? selected,int indexes) async {
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


}

