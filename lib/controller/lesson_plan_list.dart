
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../networkService/network_service.dart';
import '../pages/mainSceen/pages/attendanceList/model/attandances/attandance_group_gridview.dart';
import '../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';

class LessonPlanPostListsController extends GetxController {
  var isLoading = false;
  List<PlanList> planList = [];
  List<AttendanceInfo> attendanceInfo = [];
  //final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();


  Future<void> apiUsersAttendanceList(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchAttendanceList(id);
    attendanceInfo = response.attendanceInfo!.reversed.toList();
    if (kDebugMode) {
      print("UserAttendanceController -> GET: $response");
    }
    isLoading = false;
    update();
  }


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
  //
  // Future<void> refreshInLessonPlanPostListsController() async {
  //   isLoading = true;
  //   update();
  //   var response = await NetworkService.getNewAccessToken();
  //   print('getNewAccessToken Controller response in refreshInLessonPlanPostListsController: $response');
  //   if (response != null) {
  //     dynamic decodedResponse = jsonDecode(response);
  //     String accessToken = decodedResponse['access_token'];
  //     SharedPreferenceData.setToken(LoginResponse(data: Data(accessToken: accessToken)));
  //     print('Controller Yangi token olindi in refreshInLessonPlanPostListsController: $accessToken');
  //   } else {
  //     isLoading = false;
  //     update();
  //   }
  // }

}