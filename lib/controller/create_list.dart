import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

import '../logService/log_service.dart';

class CreateController extends GetxController {
  var isLoading = false;
  var listOfStudents = [];


  void apiListOfStudents(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.GET(
        NetworkService.API_group_profile+id.toString(), NetworkService.paramsEmpty());
    if (response != null) {
      LogService.w(response);
      listOfStudents = NetworkService.parsePostList(response);
    } else {
      listOfStudents = [];
    }
    isLoading = false;
    update();
  }
}
