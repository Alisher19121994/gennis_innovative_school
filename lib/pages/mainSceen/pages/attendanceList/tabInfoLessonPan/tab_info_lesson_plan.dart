import 'package:flutter/material.dart';
import '../../../../../projectImages/projectImages.dart';
import '../../createList/create_list.dart';
import '../../eduPlan/edu_plan.dart';

class TabPage extends StatefulWidget {
  final int setId;
  final int setGroupId;
  const TabPage({super.key, required this.setId, required this.setGroupId});
  static const String id = "tabPage";

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: const Color(0xFF00C2FF),
              elevation: 0,
              centerTitle: true,
              title: Row(
                children: [
                  const SizedBox(width: 60,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 130,
                    child: Image.asset(ProjectImages.topLogo),
                  ),
                ],
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
                        "Lesson plan",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Check out",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]
              )
          ),
          body:TabBarView(
            children: [
               EduPlanPage(eduPlanListId: widget.setGroupId,),
               CheckList(ids: widget.setId,)
            ],
          ),
        ));
  }
}
