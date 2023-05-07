import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/main.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/edu_plan_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/newAttendancePage/new_attendance_page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/users_list.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_data.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_photo.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gennis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes:{
        SignIn.id:(context) => const SignIn(),
        EntrancePage.id:(context) => const EntrancePage(),
        UsersList.id:(context) => const UsersList(),
        AttendanceList.id:(context) => const AttendanceList(),
        CreateList.id:(context) => const CreateList(),
        EduPlanList.id:(context) => const EduPlanList(),
        ProfilePage.id:(context) => const ProfilePage(),
        MainPage.id:(context) => const MainPage(),
        EditPhoto.id:(context) => const EditPhoto(),
        AttendanceCheckOut.id:(context) => const AttendanceCheckOut(),
        EditData.id:(context) => const EditData(),
    }
    );
  }
}
