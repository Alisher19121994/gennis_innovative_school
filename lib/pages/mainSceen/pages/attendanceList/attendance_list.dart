import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/lesson_plan_list.dart';
import '../../../../widget_views/attendance/mainAttendance/custom_attendance.dart';

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
    Get.find<LessonPlanPostListsController>().apiLessonPlanList(widget.ids);
    Get.find<LessonPlanPostListsController>().apiUsersAttendanceList(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LessonPlanPostListsController>(
        init: LessonPlanPostListsController(),
        builder: (controller){
          return attendance(context,controller,widget.ids);
        },
      ),
    );
  }

}
