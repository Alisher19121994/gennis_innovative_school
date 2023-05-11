import 'dart:ffi';

class User{
  String? token;
  String? id;
  String? loggedIn;

  User(this.token, this.id,this.loggedIn);

  User.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        id = json['id'],
        loggedIn = json['loggedIn'];

  Map<String, dynamic> toJson() => {
    'token': token,
    'id': id,
    'loggedIn': loggedIn,
  };
}