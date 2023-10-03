import 'package:flutter/foundation.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import '../pages/mainSceen/pages/attendanceList/model/attandances/users_in_attandance_in_listVertical.dart';

class NewAttendanceController extends GetxController {
  var isLoading = false;
  var isChecked = true;
  List<NewAttendanceInfo> attendanceInfo = [];


  Future<void> apiNewAttendanceDayList(int id,String date) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchAttendanceDayList(id,date);
    attendanceInfo = response?.attendanceInfo as List<NewAttendanceInfo> ;
    if (kDebugMode) {
      print("NewAttendanceController -> GET: $response");
    }
    isLoading = false;
    update();
  }


}
