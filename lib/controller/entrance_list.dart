import 'dart:convert';
import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import '../pages/entrancePage/model/groups_data.dart';

class EntranceController extends GetxController {
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

  void useRefreshToken() async {
    var response = await NetworkService.getNewAccessToken();
    print('Bu yangi token: $response');
    if(response != null){
      final data = json.decode(response.body);
      print('Bu yangi token olindi: $data');
      SharedPreferenceData.setToken(data);
    }
  }
}
