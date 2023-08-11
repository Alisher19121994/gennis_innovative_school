import 'package:gennis_innovative_school/pages/registration/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class SharedPreferenceData {

   static Future<String?> getRefreshToken() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? refreshToken = prefs.getString('refresh_token');
   return refreshToken;
   }

   static Future<void> setRefreshToken(LoginResponse loginResponse) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('refresh_token', loginResponse.data!.refreshToken!);
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


}
