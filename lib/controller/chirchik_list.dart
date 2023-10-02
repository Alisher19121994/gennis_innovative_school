import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

import '../pages/profilePage/morePage/model/teachers_salary.dart';

class ChirchikController extends GetxController {
  var isLoading = false;
  List<DataOfTeachersSalary> listOfTeachersSalary = [];
  DataOfTeachersSalary dataOfTeachersSalary = DataOfTeachersSalary();

  Future<void> apiChirchikSalary() async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchTeachersSalary();
    listOfTeachersSalary = response.data!;
    update();
    isLoading = false;
    update();
  }



}

