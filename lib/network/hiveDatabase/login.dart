import 'package:hive/hive.dart';

import '../../pages/registration/model/login_response.dart';

class LoginByHive{
  static var box =  Hive.box('login');

  static void saveUser(LoginResponse loginResponse){
   // box.put('true', responseLoggedInEntity.toJson());
    box.put('true', loginResponse.success);
  }
  static LoginResponse fetchUser(){
    var user = LoginResponse.fromJson(box.get('true'));
    return user;
  }
  static void removeUser(){
    box.delete('true');
  }
}