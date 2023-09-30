
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/model/lesson_plan_post.dart';
import 'package:get/get.dart';
import '../pages/mainSceen/pages/attendanceList/model/lesson_plan_get.dart';

class EduLessonPlanController extends GetxController {
  var isLoading = false;
  final formKey = GlobalKey<FormState>();
  late String lesson;
  late String lessonTarget;
  late String assessment;
  late String mainLesson;
  late String homework;
  LessonPlanGet lessonPlanGet = LessonPlanGet();
  LessonPlanPost lessonPlanPost = LessonPlanPost();

  Future<void> apiLessonPlanAllList(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchLessonPlanAllList(id);
    lessonPlanGet = response;
    if (kDebugMode) {
      print("EduLessonPlanController -> GET: $response");
    }
    isLoading = false;
    update();
  }

  Future<void> apiPostLessonPlan(int id, LessonPlanPost lessonPlanPosts) async {
    isLoading = true;
    update();
    var response = await NetworkService.postLessonPlan(id, lessonPlanPosts);
    if (response != null) {
      if (kDebugMode) {
        print("EduLessonPlanController -> POST: $response");
      }
      isLoading = false;
      update();
    }
  }

  void isValidData(String data){
    if(data.isNotEmpty){
      data = '';
      update();
    }
  }
}
