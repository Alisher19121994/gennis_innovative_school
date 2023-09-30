

import 'dart:convert';

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
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globalModel/create_new_users.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';

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

  Future<void> apiPostOfStudentsAttendance(CreateAttendances userLists,BuildContext context) async {
    isLoading = true;
    update();
     var response = await NetworkService.postAllUsers(userLists);
    if (response != null) {
      dynamic decodedResponse = jsonDecode(response);
      String msg = decodedResponse['msg'];
     // String success = decodedResponse['success'];
       SharedPreferenceData.setError(msg);
      // SharedPreferenceData.setSuccesses(success);
      if (kDebugMode) {
        print(response);
      }
      dialogBuilderChecked(context);
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

  Future<void> dialogBuilderChecked(BuildContext context) async{
    String? msg = await SharedPreferenceData.getError();
    return  Dialogs.materialDialog(
        barrierDismissible: false,
        color:  const Color(0xFF00C2FF),
        msg: msg,
        title: 'ESSENTIAL',
        customViewPosition: CustomViewPosition.BEFORE_ACTION,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'BACK',
            color: Colors.white,
            textStyle: const TextStyle(color: Colors.black),
            iconColor: Colors.white,
          ),
        ]);
  }

  Future<void> dialogBuilderUnChecked(BuildContext context) {
    return  Dialogs.materialDialog(
       barrierDismissible: false,
        color: Colors.yellow,
        msg: 'Students have been already checked on this day',
        title: 'WARNING',
        customViewPosition: CustomViewPosition.BEFORE_ACTION,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Choose another day',
            iconData: Icons.sell_outlined,
            color: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }


}

