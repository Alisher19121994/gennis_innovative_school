import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/edu_plan_list.dart';
import '../edu_plan.dart';

Widget eduPlan(BuildContext context,EduLessonPlanController controller){
  return Container(
    margin: const EdgeInsets.only(left: 1.0,right: 1.0,top: 2.0),
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    child: Stack(
      children: [
        lessonPlanGet(controller.lessonPlanGet),
        controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox.shrink(),
      ],
    ),
  );
}