import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/mainSceen/pages/attendanceList/model/lesson_plan_get.dart';

Widget lessonPlanGet(LessonPlanGet lessonPlanGet){
  return Container(
    margin: const EdgeInsets.only(left: 0.1,right: 0.1,top: 3.0),
    padding: const EdgeInsets.all(2.2),
    width: double.infinity,
    decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(1.7),
        border: Border.all(width: 1.7,color: const Color(0xFF00C2FF))
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //#Date
        Container(
          padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color:  const Color(0xFF00C2FF)
          ),
          height: 50,
          width: double.infinity,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Date:',style: TextStyle(color: Colors.black,fontSize: 21.5,fontWeight: FontWeight.bold)),
                const SizedBox(width: 7,),
                Container(
                    padding: const EdgeInsets.all(2.7),
                    child:  Text(lessonPlanGet.lessonPlan?.date ?? '',
                        style: const TextStyle(color: Colors.black,fontSize: 18.5,fontWeight: FontWeight.bold,
                        ))),

              ],
            ),
          ),
        ),
        const SizedBox(height: 8.7,),
        Column(
          children: [
            //#lesson
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                    width: double.infinity,
                    child: const Text('LESSON',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                  width: double.infinity,
                  child: Text(lessonPlanGet.lessonPlan?.lessonName ?? '',style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),
                    overflow: TextOverflow.clip,),
                ),
              ],
            ),
            const SizedBox(height: 8.7,),
            //#learninig outcomes
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                    width: double.infinity,
                    child: const Text('Learning outcome(s)',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                  width: double.infinity,
                  child: Text(lessonPlanGet.lessonPlan?.lessonTarget ?? '',style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal
                    ,overflow: TextOverflow.clip,)),
                ),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Assessments
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                    width: double.infinity,
                    child: const Text('Assessments',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                  width: double.infinity,
                  child: Text(lessonPlanGet.lessonPlan?.assessment ?? '', overflow: TextOverflow.clip,style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Homework to check
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                    width: double.infinity,
                    child: const Text('Homework to check',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                  width: double.infinity,
                  child: Text(lessonPlanGet.lessonPlan?.lastHomework ?? '',style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal), overflow: TextOverflow.clip,),
                ),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Main lesson
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                    width: double.infinity,
                    child: const Text('Main lesson',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                  width: double.infinity,
                  child: Text(lessonPlanGet.lessonPlan?.mainLesson ?? '',style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),
                    overflow: TextOverflow.clip,),
                ),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Homework
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                     padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                     width: double.infinity,
                     child: const Text('Homework',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.only(top: 1.0,left: 6.0,right: 6.0),
                  width: double.infinity,
                  child: Text(lessonPlanGet.lessonPlan?.newHomework ?? '',style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),
                    overflow: TextOverflow.clip,),
                ),

              ],
            ),
          ],
        ),
      ],
    ),
  );
}