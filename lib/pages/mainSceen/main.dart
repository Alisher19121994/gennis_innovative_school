import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlan/POSTlessonPlan/post_lesson_plan.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlan/edu_plan.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/users_list.dart';
import '../../projectImages/projectImages.dart';

class MainPage extends StatefulWidget {

  final int setId;
  const MainPage({Key? key, required this.setId}) : super(key: key);
  static const String id = "mainPage";


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var page = true;
  int currentPage = 0;
  List pages = [
    const UsersList(ids: 0),
    const AttendanceList(ids: 0,),
    const CheckList(ids: 0,),
  ];

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
      body: _buildPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
           currentPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: const Color(0xFF00C2FF),
        unselectedItemColor: const Color(0xFF54185D),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.pending_actions_outlined), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.checklist_rtl_outlined), label: 'Check'),
          BottomNavigationBarItem(icon: Icon(Icons.cast_for_education_outlined), label: 'Lesson plan'),
        ],
      ),
    );
  }
  Widget _buildPage() {
    switch (currentPage) {
      case 0:
        return UsersList(ids: widget.setId);
      case 1:
        return AttendanceList(ids: widget.setId);
      case 2:
        return CheckList(ids: widget.setId);
      case 3:
        return const PostLessonPlanPage();
      default:
        return Container();
    }
  }
}
