import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/profilePage/model/user_profile.dart';

class ProfileController extends GetxController {
  XFile? _pickedFile;
  XFile? get pickedFile => _pickedFile;
  final _picker = ImagePicker();

  var isLoading = false;
  UserProfile userProfile = UserProfile();
  final formKey = GlobalKey<FormState>();
  late String userName;
  late String name;
  late String lastName;
  late String dateOfBirth;
  late String phoneNumber;

  Future<void> getProfileDate() async {
    isLoading = true;
    update();
    UserProfile response =
        await NetworkService.fetchProfileData(NetworkService.API_profile);
    userProfile = response;
    if (kDebugMode) {
      print(response);
    }
    isLoading = false;
    update();
  }

  Future<void> logout() async {
    isLoading = true;
    update();
    var response = await NetworkService.logoutOfUser();
    if (response != null) {
      isLoading = false;
      update();
    }
  }

  Future<void> pickImage() async {
     _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  Future<void> upLoad()async{
    isLoading = true;
    update();
    http.StreamedResponse response = await NetworkService.createImage(_pickedFile);
    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      String message = map['message'];
      print("message: -> $message");
      isLoading = false;
      update();
    }
  }
}
