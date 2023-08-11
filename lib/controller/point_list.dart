import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

class PointListController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isLoading = false;
  var isPaid = false;
  List<Students> listOfStudents = [];
  late Students students;
  UserList userList = UserList();


  void apiPointListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    listOfStudents = response?.data!.students as List<Students>;
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
