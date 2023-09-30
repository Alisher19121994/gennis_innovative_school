import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/lesson_plan_list.dart';
import '../../../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';
import '../../edu_plan/edu_plan.dart';
import '../../edu_plan/post_edu_plan/lesson_plan_in_attendance.dart';
import '../lesson_plan.dart';
import '../list_of_students_check_out.dart';

Widget attendance(BuildContext context,LessonPlanPostListsController controller,int id){
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
                      return lessonPlanForAttendance(context,planList,id);
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


        ],
        ),
      ),
    ],
  );
}