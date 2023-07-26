import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../controller/profile_page.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../widget_views/profile/profile.dart';
import '../../widget_views/profile/teacherDeatails.dart';
import 'model/user_profile.dart';
import 'morePage/edit_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String id = "profilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().getProfileDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          PopupMenuButton(
            offset: const Offset(0, 40),
            elevation: 2,
            iconSize: 22,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                  child: Column(children: [
                //#edit data
                     Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 24,
                      color: Colors.black.withOpacity(0.60),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, EditData.id);
                      },
                      child: const Text(
                        "Edit profile data",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 15),
                //#logout
                Row(
                  children: [
                    Icon(
                      Icons.logout_sharp,
                      size: 24,
                      color: Colors.black.withOpacity(0.60),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        SharedPreferenceData.removeLoggedIn();
                        SharedPreferenceData.removeToken();
                        SharedPreferenceData.removeId();
                        Navigator.pushReplacement(
                            context, SignIn.id as Route<Object?>);
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    )
                  ],
                )
              ])),
            ],
          ),
        ],
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller){
          return Column(
            children: [
              //#appBar items,photo,fullName
              topBarDetails(controller),
              //#teacher details
              teacherDetails(controller)
            ],
          );
        },
      )
    );
  }
}
