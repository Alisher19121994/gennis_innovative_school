import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlan/POSTlessonPlan/post_lesson_plan.dart';
import 'package:get/get.dart';
import '../../../../controller/edu_plan_list.dart';
import '../../../../widget_views/edu_plan/edu_plan.dart';
import '../../../../widget_views/edu_plan/main_page/main_page.dart';
import '../attendanceList/model/lesson_plan_get.dart';
import 'modelLessonPlan/lesson_plan_list.dart';

class EduPlanPage extends StatefulWidget {
  final int eduPlanListId;
  static const String id = "eduPlanPage";
  const EduPlanPage({super.key, required this.eduPlanListId});

  @override
  State<EduPlanPage> createState() => _EduPlanPageState();
}

class _EduPlanPageState extends State<EduPlanPage> {
  @override
  void initState() {
    super.initState();
    Get.find<EduLessonPlanController>().apiLessonPlanAllList(widget.eduPlanListId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:GetBuilder<EduLessonPlanController>(
        init: EduLessonPlanController(),
        builder:(controller){
          return eduPlan(context,controller);
        },
      ),
    );
  }
}
