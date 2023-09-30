import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../pages/mainSceen/pages/attendanceList/tabInfoLessonPan/tab_info_lesson_plan.dart';
import '../../../pages/mainSceen/pages/eduPlan/POSTlessonPlan/post_lesson_plan.dart';
import '../../../pages/mainSceen/pages/eduPlan/modelLessonPlan/lesson_plan_list.dart';

Widget lessonPlanForAttendance(BuildContext context,PlanList planList,int setId){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>TabPage(setGroupId: planList.id ?? 0, setId: setId)));
    },
    child: Container(
      height: 119,
      width: 229,
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
          const Icon(Icons.cast_for_education_outlined,size: 28,),
          const Center(child: Text('Lesson plan',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
          Center(child: Text(planList.date ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
        ],
      ),

    ),
  );
}
