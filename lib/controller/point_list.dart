import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

import '../network/sharedPreferenceData/shared_preference_data.dart';

class PointListController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isLoading = false;
  var isPaid = false;
  List<StudentsData> listOfStudents = [];
  late StudentsData students;
  UserList userList = UserList();
  var image = SharedPreferenceData.getImageURL();


  void apiPointListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(NetworkService.API_group_profile,id);
    listOfStudents = response?.data!.students as List<StudentsData>;
    isLoading = false;
    update();

  }
}
