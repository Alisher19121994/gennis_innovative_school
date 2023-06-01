import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/main.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/new_attendance_page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlanList/edu_plan_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/users_list.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_data.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_photo.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/pages/splash/splash_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
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
      //home:  const MainPage(ids: 0,),
      routes:{
        SignIn.id:(context) => const SignIn(),
        EntrancePage.id:(context) => const EntrancePage(),
        UsersList.id:(context) =>  UsersList(selectedItem: 0,),
        AttendanceList.id:(context) => const AttendanceList(),
        CreateList.id:(context) =>  const CreateList(createId: 0,),
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
