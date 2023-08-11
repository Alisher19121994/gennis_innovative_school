//import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages/profilePage/main_profile_page.dart';
import '../../../pages/profilePage/model/user_profile.dart';
import '../../../projectImages/projectImages.dart';
/*
* this is the app Bar title data, which user can be opened his/her profile via pressing image button!!!
* */
Widget clickedProfile(BuildContext context,UserProfile userProfile){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 130,
        child: Image.asset(ProjectImages.topLogo),
      ),
      GestureDetector(
        onTap: () {
         // Get.to(const ProfilePage());
          Navigator.pushNamed(context,  ProfilePage() as String);
        },
        child: CircleAvatar(
          radius: 24,
          //backgroundImage: NetworkImage(userProfile.user?.photoProfile ?? ''),
        ),
      )
    ],
  );
}