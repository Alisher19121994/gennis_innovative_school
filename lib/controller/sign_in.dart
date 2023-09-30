import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import 'package:gennis_innovative_school/pages/registration/model/sign_in.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../networkService/network_service.dart';

class SignInController extends GetxController {
  var isLoading = false;
  LogIn logIn = LogIn();
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  bool passwordVisible = false;
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  Future<void> isLoggedInUser() async {
    isLoading = true;
    update();
    var response = await NetworkService.loginUser(logIn);
    if (kDebugMode) {
      print('loginUser: $response');
    }

    if (response != null) {
      dynamic decodedResponse = jsonDecode(response);
      bool success = decodedResponse['success'];
      SharedPreferenceData.setSuccess(success);
      if (kDebugMode) {
        print('Controller success status saved: $success');
      }
      isLoading = false;
      update();
    }
  }

  Future<void> dialogBuilder(BuildContext context) {
    return  Dialogs.materialDialog(
        barrierDismissible: false,
        color: Colors.red,
        msg: 'Username or Password',
        title: 'ERROR',
        customViewPosition: CustomViewPosition.BEFORE_ACTION,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Try again',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  void isValidPassword(bool passwordVisible){
    if(passwordVisible == true){
      passwordVisible = true;
      update();
    }
  }

  void isValidLogin(String data){
    if(data.isNotEmpty){
      data = '';
      update();
    }
  }
}
