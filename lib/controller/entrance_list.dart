
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import '../pages/entrancePage/model/groups_data.dart';

class EntranceController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isLoading = false;
  List<Groups> listOfGroups = [];
  GroupOfData groupOfData = GroupOfData();

  void apiEntranceOfGroups() async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchGroupData(NetworkService.API_my_groups);
    listOfGroups = response.groups!;
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
