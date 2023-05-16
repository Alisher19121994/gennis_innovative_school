import 'dart:convert';
import 'package:gennis_innovative_school/pages/registration/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class SharedPreferenceData {
   //setLoggedIn
  static Future<bool> setLoggedIn(LoginResponse loginResponse) async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.setBool("isLoggedIn", loginResponse.success!);
   }

   //getLoggedIn
  // static Future<bool?> getLoggedIn() async {
  //    final SharedPreferences preferences = await SharedPreferences.getInstance();
  //    return preferences.getBool("true")?? false;
  //  }

   // setToken
   static Future<bool> setToken(LoginResponse loginResponse)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString('token',loginResponse.data!.accessToken!);
   }

  // getToken
   static Future<String?> getToken()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('token');
   }

   //setId
   static Future<bool> setId(LoginResponse loginResponse)async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString('id', loginResponse.data!.id.toString());
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
