import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/edu_plan_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/users_list.dart';

import '../../projectImages/projectImages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String id = "mainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  List pages = [const UsersList(), const AttendanceList(), const CreateList(), const EduPlanList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C2FF),
        elevation: 0,
        centerTitle: true,
        bottomOpacity: 20.0,
        title: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 130,
              child: Image.asset(ProjectImages.topLogo),
            ),
          ],
        ),
      ),

      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value){
         setState(() {
           currentPage = value;
         });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: const Color(0xFF00C2FF),
        unselectedItemColor:  const Color(0xFF54185D),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.pending_actions_outlined),label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded),label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.cast_for_education_outlined),label: 'Edu-action'),
        ],
      ),
    );
  }
}
