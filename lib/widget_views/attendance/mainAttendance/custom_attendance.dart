import 'package:flutter/material.dart';
import '../../../controller/lesson_plan_list.dart';
import '../../../pages/mainSceen/pages/attendanceList/model/attandances/attandance_group_gridview.dart';
import '../../../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';
import '../../edu_plan/post_edu_plan/lesson_plan_in_attendance.dart';
import '../list_of_students_check_out.dart';

Widget attendance(BuildContext context, LessonPlanPostListsController controller, int id) {
  return  Column(
    children: [
      Container(
        height: 117,
        width: double.infinity,
        padding: const EdgeInsets.all(1.0),
        child: Stack(
          children: [
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.planList.length,
                itemBuilder: (context, index) {
                  PlanList planList = controller.planList[index];
                  return lessonPlanForAttendance(context, planList, id);
                }),
            controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ],
        ),
      ),
      Expanded(
        child: Stack(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0
                ),
                itemCount: controller.attendanceInfo.length,
                itemBuilder: (context, index) {
                  AttendanceInfo attendanceInfo = controller.attendanceInfo[index];
                  return listOfStudentsCheckOut(context, attendanceInfo, id);
                }),
            controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ],
        ),
      )
    ],
  );
  // return LiquidPullToRefresh(
  //   backgroundColor: const Color(0xFF00C2FF),
  //   key: controller.refreshIndicatorKey,
  //   color: const Color(0xFF00C2FF),
  //   onRefresh: () {
  //     return controller.refreshInLessonPlanPostListsController();
  //   },
  //   child: Column(
  //     children: [
  //       Container(
  //         height: 117,
  //         width: double.infinity,
  //         padding: const EdgeInsets.all(1.0),
  //         child: Stack(
  //           children: [
  //             ListView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: controller.planList.length,
  //                 itemBuilder: (context, index) {
  //                   PlanList planList = controller.planList[index];
  //                   return lessonPlanForAttendance(context, planList, id);
  //                 }),
  //             controller.isLoading
  //                 ? const Center(child: CircularProgressIndicator())
  //                 : const SizedBox.shrink(),
  //           ],
  //         ),
  //       ),
  //       Expanded(
  //         child: Stack(
  //           children: [
  //             GridView.builder(
  //                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //                     maxCrossAxisExtent: 200,
  //                      childAspectRatio: 3 / 2,
  //                     crossAxisSpacing: 2.0,
  //                     mainAxisSpacing: 2.0
  //                 ),
  //                 itemCount: controller.attendanceInfo.length,
  //                 itemBuilder: (context, index) {
  //                   AttendanceInfo attendanceInfo = controller.attendanceInfo[index];
  //                   return listOfStudentsCheckOut(context, attendanceInfo, id);
  //                 }),
  //             controller.isLoading
  //                 ? const Center(child: CircularProgressIndicator())
  //                 : const SizedBox.shrink(),
  //           ],
  //         ),
  //       )
  //     ],
  //   ),
    // child: CustomScrollView(
    //   slivers: <Widget>[
    //     SliverList(
    //       delegate: SliverChildListDelegate(
    //         [
    //           Container(
    //             height: 117,
    //             width: double.infinity,
    //             padding: const EdgeInsets.all(1.0),
    //             child: Stack(
    //               children: [
    //                 ListView.builder(
    //                     scrollDirection: Axis.horizontal,
    //                     itemCount: controller.planList.length,
    //                     itemBuilder: (context, index) {
    //                       PlanList planList = controller.planList[index];
    //                       return lessonPlanForAttendance(context, planList, id);
    //                     }),
    //                 controller.isLoading
    //                     ? const Center(child: CircularProgressIndicator())
    //                     : const SizedBox.shrink(),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SliverGrid(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //       delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    //             return  Stack(
    //               children: [
    //                 GridView.builder(
    //                     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //                         maxCrossAxisExtent: 400,
    //                         // childAspectRatio: 3 / 2,
    //                         crossAxisSpacing: 1.0,
    //                         mainAxisSpacing: 1.0
    //                     ),
    //                     itemCount: controller.attendanceInfo.length,
    //                     itemBuilder: (context, index) {
    //                       AttendanceInfo attendanceInfo = controller.attendanceInfo[index];
    //                       return listOfStudentsCheckOut(context, attendanceInfo,id);
    //                     }),
    //                 controller.isLoading
    //                     ? const Center(child: CircularProgressIndicator())
    //                     : const SizedBox.shrink(),
    //               ],
    //             );
    //           }
    //       ),
    //     ),
    //   ],
    // )


}
