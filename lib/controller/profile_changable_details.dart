import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../pages/profilePage/morePage/model/profile_details_post.dart';
class ProfileDetailsController extends GetxController {
  var isLoading = false;
  final formKey = GlobalKey<FormState>();
  late String userName;
  late String name;
  late String lastName;
  late String fathersName;
  late String dateOfBirth;
  late String phoneNumber;
  late String type;
  late String role;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  List<String> listOfDay = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'];
  List<String> listOfMonth = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  List<String> listOfYear = ['1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994'
    ,'1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014'
    ,'2015','2016','2017','2018','2019','2020','2021','2022','2023'];

  Future<void> apiPostProfile(ProfileDetailsPost profileDetailsPosts) async {
    isLoading = true;
    update();
    var response = await NetworkService.postProfileDetails(profileDetailsPosts);
    if (response != null) {
      if (kDebugMode) {
        print("ProfileDetailsController -> POST is done: $response");
      }
      isLoading = false;
      update();
    }
  }

  void isValidDetails(String data){
    data = '';
    update();
  }


}
