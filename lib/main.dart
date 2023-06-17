import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/pages/groupPage/group_Page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/main.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/new_attendance_page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlanList/edu_plan_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/pointList/point_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/users_list.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_data.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_photo.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/pages/splash/splash_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'networkService/di_service/di_service.dart';

void main()async {
  await DIService.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('login');
  ChuckerFlutter.showOnRelease = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: const SplashPage(),
      //home: const MainPage(setId: 0),
      routes:{
        SignIn.id:(context) => const SignIn(),
        EntrancePage.id:(context) => const EntrancePage(),
        UsersList.id:(context) =>  UsersList(ids: 0,),
        AttendanceList.id:(context) => const AttendanceList(ids: 0,),
        CheckList.id:(context) =>  const CheckList(ids: 0,),
        EduPlanList.id:(context) => const EduPlanList(ids: 0,),
        ProfilePage.id:(context) => const ProfilePage(),
        MainPage.id:(context) => const MainPage(setId: 0,),
        EditPhoto.id:(context) => const EditPhoto(),
        AttendanceCheckOut.id:(context) => const AttendanceCheckOut(),
        EditData.id:(context) => const EditData(),
        GroupPage.id:(context) => const GroupPage(getGroupId: 0,),
        PointList.id:(context) => const PointList(ids: 0,),
    }
    );
  }
}
