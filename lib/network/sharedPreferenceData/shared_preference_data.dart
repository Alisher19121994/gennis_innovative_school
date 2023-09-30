import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:gennis_innovative_school/pages/profilePage/model/user_profile.dart';
import 'package:gennis_innovative_school/pages/registration/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/mainSceen/pages/usersList/model/users.dart';

 class SharedPreferenceData {

   static Future<String?> getSuccesses() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String? refreshToken = prefs.getString('getSuccesses');
     return refreshToken;
   }

   static Future<void> setSuccesses(String success) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('getSuccesses', success);
   }

   static Future<String?> getError() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String? refreshToken = prefs.getString('errors');
     return refreshToken;
   }

   static Future<void> setError(String success) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('errors', success);
   }

   static Future<String?> getSuccess() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String? refreshToken = prefs.getString('success');
     return refreshToken;
   }

   static Future<void> setSuccess(bool success) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setBool('success', success);
   }


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
     return preferences.setString('token',loginResponse.data?.accessToken?? '');
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

   //setGroupId
   static Future<bool> setGroupId(UserList userList)async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setInt('ids', userList.groupID!);
   }

   //getId
   static Future<int?> getGroupId()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getInt('ids');
   }

   ////
   static Future<bool> setDayId(int day)async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString('day',day.toString());
   }

   //getId
   static Future<dynamic> getDayId()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('day') ?? '';
   }
   /////a///

   static Future<bool> setMonthL(String month)async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString('month',month);
   }

   //getId
   static Future<String> getMonth()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('month') ?? '';
   }

   static Future<bool> setImageURL(UserProfile image)async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString('image',image.user!.photoProfile!);
   }

   //getId
   static Future<String> getImageURL()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getString('image') ?? '';
   }

}
