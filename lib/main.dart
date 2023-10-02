import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/drawer/additionalList/additional_page.dart';
import 'package:gennis_innovative_school/pages/drawer/contentList/content_page.dart';
import 'package:gennis_innovative_school/pages/drawer/informationList/information_page.dart';
import 'package:gennis_innovative_school/pages/drawer/main_drawer_page.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/main.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/new_attendance_page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/tabInfoLessonPan/tab_info_lesson_plan.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlan/POSTlessonPlan/post_lesson_plan.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlan/edu_plan.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlan/lessonPlanListForPost/lesson_plan_list_for_post.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/users_list.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_data.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_photo.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/edit_profile_details.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/tabBarsOfLocations/pages/chirchikPage.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/tabBarsOfLocations/pages/gazalkent_page.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/tabBarsOfLocations/pages/xujakent_page.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/teachers_salary_page.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/pages/splash/splash_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'networkService/di_service/di_service.dart';

void main() async {
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: const SplashPage(),
      // initialRoute: ConstantRoutes.SPLASH,
      // routes: {
      //   ConstantRoutes.SIGNIN: (context) => const SignIn(),
      //   ConstantRoutes.ENTRANCEPAGE: (context) => const EntrancePage(),
      //   ConstantRoutes.USERLIST: (context) => const UsersList(ids: 0),
      //   ConstantRoutes.ATTENDANCELIST: (context) => const AttendanceList(ids: 0),
      //   ConstantRoutes.CHECKLIST: (context) => const CheckList(ids: 0),
      //   ConstantRoutes.PROFILEPAGE: (context) => const ProfilePage(),
      //   ConstantRoutes.MAINPAGE: (context) => const MainPage(setId: 0),
      //   ConstantRoutes.EDITPHOTO: (context) => const EditPhoto(),
      //   ConstantRoutes.EDITDATA: (context) => const EditData(),
      //   ConstantRoutes.ATTENDANCECHECKOUT: (context) => const AttendanceCheckOut(),
      //   ConstantRoutes.ADDITIONALPAGE: (context) => const AdditonalPage(),
      //   ConstantRoutes.CONTENTPAGE: (context) => const ContentPage(),
      //   ConstantRoutes.INFORMATIONPAGE: (context) => const InformationPage(),
      // },
        routes:{
          MainDrawer.id:(context) => const MainDrawer(),
          SignIn.id:(context) => const SignIn(),
          EntrancePage.id:(context) => const EntrancePage(),
          UsersList.id:(context) =>  const UsersList(ids: 0,),
          AttendanceList.id:(context) => const AttendanceList(ids: 0,),
          CheckList.id:(context) =>  const CheckList(ids: 0,),
          ProfilePage.id:(context) => const ProfilePage(),
          MainPage.id:(context) => const MainPage(setId: 0,),
          EditPhoto.id:(context) => const EditPhoto(),
          AttendanceCheckOut.id:(context) => const AttendanceCheckOut(),
          EditData.id:(context) => const EditData(),
          AdditonalPage.id:(context) => const AdditonalPage(),
          ContentPage.id:(context) => const ContentPage(),
          InformationPage.id:(context) => const InformationPage(),
          EduPlanPage.id:(context) => const EduPlanPage(eduPlanListId: 0,),
          PostLessonPlanPage.id:(context) => const PostLessonPlanPage(postLessonPlanId: 0,),
          EditProfileDetails.id:(context) => const EditProfileDetails(),
          TabPage.id:(context) => const TabPage(setId: 0, setGroupId: 0,),
          LessonPlanListForPost.id:(context) => const LessonPlanListForPost(ids: 0),
          TeachersSalary.id:(context) => const TeachersSalary(),
          GazalkentPage.id:(context) => const GazalkentPage(),
          ChirchikPage.id:(context) => const ChirchikPage(),
          XujakentPage.id:(context) => const XujakentPage(),
      }
    );
  }
}
