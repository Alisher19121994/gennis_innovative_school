import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/tabInfoLessonPan/tab_info_lesson_plan.dart';
import 'package:get/get.dart';
import '../../../../controller/attendance_list.dart';
import '../../../../projectImages/projectImages.dart';
import '../../../../widget_views/attendance/lesson_plan.dart';
import '../../../../widget_views/attendance/list_of_students_check_out.dart';
import '../../../../widget_views/attendance/mainAttendance/custom_attendance.dart';
import '../eduPlan/edu_plan.dart';
import '../eduPlan/modelLessonPlan/lesson_plan_list.dart';
import 'new_attendance_page.dart';

class AttendanceList extends StatefulWidget {
  final int ids;
  const AttendanceList({Key? key, required this.ids}) : super(key: key);
  static const String id = "attendanceList";

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}
class _AttendanceListState extends State<AttendanceList> {

  @override
  void initState() {
    super.initState();
    Get.find<AttendanceController>().apiLessonPlanList(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AttendanceController>(
        init: AttendanceController(),
        builder: (controller){
          return attendance(context,controller,widget.ids);
        },
      ),
    );
  }

}
