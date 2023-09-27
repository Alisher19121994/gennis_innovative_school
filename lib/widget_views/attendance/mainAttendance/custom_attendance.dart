import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/attendance_list.dart';
import '../../../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';
import '../../edu_plan/edu_plan.dart';
import '../lesson_plan.dart';
import '../list_of_students_check_out.dart';

Widget attendance(BuildContext context,AttendanceController controller,int id){
  return CustomScrollView(
    slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate([
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
                      return lessonPlan(context,planList,id);
                    }),
                controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
        ),
      ),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        delegate: SliverChildListDelegate([
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),
          listOfStudentsCheckOut(context),


        ],
        ),
      ),
    ],
  );
}