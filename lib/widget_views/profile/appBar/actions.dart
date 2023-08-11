import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages/profilePage/morePage/edit_data.dart';
import '../../../pages/profilePage/morePage/edit_photo.dart';
/*
* Widget actions() is consisted of PopupMenuButtons, which are used in the profile page, there are the user can edit data, edit photo,
* and log out in some actions
* */
Widget actions(){
  return PopupMenuButton(offset: const Offset(0, 40), elevation: 2, iconSize: 22, itemBuilder: (BuildContext context) => [
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
  ],);
}