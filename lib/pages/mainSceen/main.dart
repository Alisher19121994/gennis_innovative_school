import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlanList/edu_plan_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/users_list.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../projectImages/projectImages.dart';
import '../entrancePage/model/groups_data.dart';

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
    UsersList(ids: 0),
    const AttendanceList(ids: 0,),
    const CreateList(ids: 0,),
    const EduPlanList()
  ];



  @override
  Widget build(BuildContext context) {
    List<dynamic> pageIds = [widget.setId];

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
    //  body: pages[currentPage](pageIds[currentPage]),
      body: _buildPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
         // pageIds[value];
          // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
          //     page ? UsersList(ids: widget.setId):CreateList(ids: widget.setId)));
          setState(() {
           currentPage = value;
           //pageIds = widget.setId as List;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: const Color(0xFF00C2FF),
        unselectedItemColor: const Color(0xFF54185D),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.pending_actions_outlined), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.cast_for_education_outlined), label: 'Edu-action'),
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
        return CreateList(ids: widget.setId);
      default:
        return Container();
    }
  }
}
