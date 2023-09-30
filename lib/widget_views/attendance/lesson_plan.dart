import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/mainSceen/pages/attendanceList/tabInfoLessonPan/tab_info_lesson_plan.dart';
import '../../pages/mainSceen/pages/eduPlan/POSTlessonPlan/post_lesson_plan.dart';
import '../../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';

Widget createLessonPlan(BuildContext context,PlanList planList){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>PostLessonPlanPage(postLessonPlanId: planList.id ?? 0,)));
    },
    child: Container(
      height: 100,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
            colors: [
              Colors.blue,
              Colors.cyanAccent,
            ],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 3.0),
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.cast_for_education_outlined,size: 21,),
          const Center(child: Text('Lesson plan',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),)),
          Center(child: Text(planList.date ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),)),
        ],
      ),

    ),
  );
}