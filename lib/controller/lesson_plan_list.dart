import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../networkService/network_service.dart';
import '../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';
import '../pages/registration/model/login_response.dart';

class LessonPlanPostListsController extends GetxController {
  var isLoading = false;
  List<PlanList> planList = [];
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();


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

  Future<void> refreshInLessonPlanPostListsController() async {
    isLoading = true;
    update();
    var response = await NetworkService.getNewAccessToken();
    print('getNewAccessToken Controller response in refreshInLessonPlanPostListsController: $response');
    if (response != null) {
      dynamic decodedResponse = jsonDecode(response);
      String accessToken = decodedResponse['access_token'];
      SharedPreferenceData.setToken(LoginResponse(data: Data(accessToken: accessToken)));
      print('Controller Yangi token olindi in refreshInLessonPlanPostListsController: $accessToken');
    } else {
      isLoading = false;
      update();
    }
  }

}