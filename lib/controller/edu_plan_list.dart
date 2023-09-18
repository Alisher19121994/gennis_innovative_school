import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gennis_innovative_school/logService/log_service.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../globalModel/create_new_users.dart';

class EduLessonPlanController extends GetxController {
  var isLoading = false;
  final formKey = GlobalKey<FormState>();
  late String lesson;
  late String dateOfLesson;
  late String assessment;
  late String mainLesson;
  late String homework;

  Future<void> apiPostOfLessonPlan(CreateAttendances userLists) async {
    isLoading = true;
    update();
    var response = await NetworkService.postAllUsers(NetworkService.API_make_attendance,userLists);
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      isLoading = false;
      update();
    }
  }

  Future<void> finish(BuildContext context) async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //Navigator.popAndPushNamed(context, AttendanceList(ids: 0,).toString());
      // Navigator.push(context, MaterialPageRoute(builder: (_)=> const AttendanceList(ids: 0)));
    });
  }

}