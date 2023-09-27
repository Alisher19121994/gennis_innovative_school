import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../networkService/network_service.dart';
import '../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';

class AttendanceController extends GetxController {
  var isLoading = false;
  List<PlanList> planList = [];

  Future<void> apiLessonPlanList(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchLessonPlanList(id);
    planList = response.planList!.reversed.toList();
    if (kDebugMode) {
      print("AttendanceController -> fetchLessonPlanList: $response");
    }
    isLoading = false;
    update();
  }

}