import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/new_page_attendance_page.dart';
import '../../../../widget_views/attendance/newAttendance/new_attendance.dart';
import 'model/attandances/users_in_attandance_in_listVertical.dart';

class AttendanceCheckOut extends StatefulWidget {
  final String date;
  final int ids;

  const AttendanceCheckOut({Key? key, required this.date, required this.ids}) : super(key: key);
  static const String id = "attendanceCheckOut";

  @override
  State<AttendanceCheckOut> createState() => _AttendanceCheckOutState();
}

class _AttendanceCheckOutState extends State<AttendanceCheckOut> {
  @override
  void initState() {
    super.initState();
    Get.find<NewAttendanceController>().apiNewAttendanceDayList(widget.ids, widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C2FF),
        title: Row(
          children: [
            const Text(
              "Date: ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.date,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: GetBuilder<NewAttendanceController>(
        init: NewAttendanceController(),
        builder: (controller) {
          return Stack(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.attendanceInfo.length,
                  itemBuilder: (context, index) {
                    NewAttendanceInfo attendanceInfo =
                        controller.attendanceInfo[index];
                    return listOfStudents(attendanceInfo);
                  }),
              controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
