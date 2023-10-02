import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/tabBarsOfLocations/pages/chirchikPage.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/tabBarsOfLocations/pages/gazalkent_page.dart';
import 'package:gennis_innovative_school/pages/profilePage/morePage/tabBarsOfLocations/pages/xujakent_page.dart';

class TeachersSalary extends StatefulWidget {
  const TeachersSalary({super.key});

  static const String id = "teachersSalary";

  @override
  State<TeachersSalary> createState() => _TeachersSalaryState();
}

class _TeachersSalaryState extends State<TeachersSalary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: const Color(0xFF00C2FF),
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Locations',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
              bottom: const TabBar(
                  physics: ScrollPhysics(),
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  tabs: [
                    Tab(
                      child: Text(
                        "Xo\'jakent",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Gazalkent",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Chirchiq",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ])),
          body: const TabBarView(
            children: [
              XujakentPage(),
              GazalkentPage(),
              ChirchikPage(),
            ],
          ),
        ));
  }
}
