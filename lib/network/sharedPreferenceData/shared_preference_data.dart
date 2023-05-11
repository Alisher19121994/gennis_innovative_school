import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/fake_user.dart';
import '../../pages/entrancePage/model/main_entrance_group_entity.dart';
import '../../pages/registration/model/response_logged_in_entity.dart';
 class SharedPreferenceData {


   //setLoggedIn
  static Future<bool> setLoggedIn(ResponseLoggedInEntity responseLoggedInEntity) async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setBool("true", responseLoggedInEntity.success);
   }

   //getLoggedIn
  static Future<bool> getLoggedIn() async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getBool("true") ?? false;
   }

   // setToken
   static Future <bool>setToken(ResponseLoggedInEntity responseLoggedInEntity) async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString('token', responseLoggedInEntity.data!.accessToken);
   }

  // getToken
   static Future <String> getToken()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('token')?? '';
   }

   //setId
   static Future<bool> setId(ResponseLoggedInEntity responseLoggedInEntity)async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString('id', responseLoggedInEntity.data!.id.toString());
   }

   //getId
   static Future<String> getId()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('id') ?? '';
   }

   //removeLoggedIn
  static Future<bool> removeLoggedIn()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove("true");
  }
  //removeToken
  static Future<bool> removeToken()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove("token");
  }

  //removeId
  static Future<bool> removeId()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove("id");
  }

}
