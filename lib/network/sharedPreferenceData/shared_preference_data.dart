import 'package:gennis_innovative_school/pages/registration/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/entrancePage/model/groups_data.dart';
import '../../pages/registration/model/sign_in.dart';

 class SharedPreferenceData {
   //setLoggedIn
   static Future setUsername(String username) async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString("username", username);
   }
   static Future getUsername() async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString("username");
   }
   static Future setPassword(String password) async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString("password",password);
   }

   static Future getPassword() async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString("password");
   }
   //setLoggedIn
  static Future<bool?> setLoggedIn(LoginResponse loginResponse) async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.setBool("isLoggedIn", loginResponse.success!);
   }


  static Future<bool?> getLoggedIn() async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getBool("isLoggedIn")?? false;
   }

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

  //setId
  static Future<bool> setInnerId(Groups groups)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('ids', groups.id.toString());
  }
  //getId
  static Future<String> getInnerId()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('ids') ?? '';
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
