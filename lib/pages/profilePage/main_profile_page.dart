import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../controller/profile_page.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../widget_views/profile/appBar/actions.dart';
import '../../widget_views/profile/appBar/title.dart';
import '../../widget_views/profile/profile.dart';
import '../../widget_views/profile/teacherDeatails.dart';
import 'model/user_profile.dart';
import 'morePage/edit_data.dart';
import 'morePage/edit_photo.dart';

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
        title: titleOfAppBar(),
        actions: <Widget>[
      PopupMenuButton(offset: const Offset(0, 40), elevation: 2, iconSize: 22, itemBuilder: (BuildContext context) => [
      PopupMenuItem<int>(
        onTap: (){
          Get.to(const EditData());
        },
        value: 1,
        child: Row(
          children: const <Widget>[
            Icon(Icons.edit,size: 17,color: Colors.black,),
            SizedBox(width: 5), // Optional spacing between icon and text
            Text('Data',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      PopupMenuItem<int>(
        onTap: (){
          Get.to(const EditPhoto());
        },
        value: 2,
        child: Row(
          children: const <Widget>[
            Icon(Icons.photo_camera,size: 17,color: Colors.black,),
            SizedBox(width: 5), // Optional spacing between icon and text
            Text('Photo',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      PopupMenuItem<int>(
        onTap: (){
          // log out
        },
        value: 3,
        child: Row(
          children: const <Widget>[
            Icon(Icons.logout,size: 17,color: Colors.black,),
            SizedBox(width: 5), // Optional spacing between icon and text
            Text('Log out',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    ],)
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
