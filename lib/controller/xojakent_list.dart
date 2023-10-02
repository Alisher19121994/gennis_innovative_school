import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';

class XojakentController extends GetxController {
  var isLoading = false;



  Future<void> apiXojakentSalary(int id) async {
    isLoading = true;
    update();
    var response = await NetworkService.fetchUsersData(id);
    //listOfStudents = response?.data?.students as List<StudentsData>;
    update();
    isLoading = false;
    update();
  }



}

