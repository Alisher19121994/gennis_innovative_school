import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import '../network/sharedPreferenceData/shared_preference_data.dart';
import '../pages/entrancePage/model/group_info.dart';

class EntranceController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isLoading = false;
  List<GroupsInfo> listOfGroups = [];
  GroupInfo groupOfData = GroupInfo();



  Future<void> apiEntranceOfGroups() async {
    String id = await SharedPreferenceData.getId();
    isLoading = true;
    update();
    var response = await NetworkService.fetchGroup();
    // var response = await NetworkService.GET('${NetworkService.API_my_groups}/$id',NetworkService.paramsEmpty());
    if (kDebugMode) {
      print(response);
    }
    // Map <String, dynamic>? body =  jsonDecode(response.toString());
    // final GroupInfo groupOfData = GroupInfo.fromJson(body!);
    // listOfGroups = groupOfData.groups!;
    //listOfGroups.add(response.groups?.reversed as GroupsInfo);
    listOfGroups = response.groups ?? [];
    //listOfGroups = NetworkService.parseStudents(response.groups.toString());
    update();
    isLoading = false;
    update();

  }


  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
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
