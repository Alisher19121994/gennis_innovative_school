import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/eduPlan/POSTlessonPlan/post_lesson_plan.dart';
import 'package:get/get.dart';
import '../../../../controller/edu_plan_list.dart';

class EduPlanPage extends StatefulWidget {
  static const String id = "eduPlanPage";
  const EduPlanPage({super.key});

  @override
  State<EduPlanPage> createState() => _EduPlanPageState();
}

class _EduPlanPageState extends State<EduPlanPage> {
  @override
  void initState() {
    super.initState();
    //Get.find<EduLessonPlanController>().apiPostOfLessonPlan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('LESSON PLAN',style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
      body:GetBuilder<EduLessonPlanController>(
        init: EduLessonPlanController(),
        builder: (controller){
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 1.0,right: 1.0,top: 2.0),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,

                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          //const SizedBox(height: 7,),
                          lessonPlan(),
                          const SizedBox(height: 7,),
                          const Divider(thickness: 1.6,color: Color(0xFF00C2FF),),
                          lessonPlan(),
                          const SizedBox(height: 7,),
                          const Divider(thickness: 1.6,color: Color(0xFF00C2FF),),
                          lessonPlan(),
                          const SizedBox(height: 7,),
                          const Divider(thickness: 1.6,color: Color(0xFF00C2FF),),
                          lessonPlan(),
                          const SizedBox(height: 7,),
                          const Divider(thickness: 1.6,color: Color(0xFF00C2FF),),
                          lessonPlan(),
                          const SizedBox(height: 7,),
                          const Divider(thickness: 1.6,color: Color(0xFF00C2FF),),
                          lessonPlan(),
                          const SizedBox(height: 7,),
                          const Divider(thickness: 1.6,color: Color(0xFF00C2FF),),
                          lessonPlan()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
Widget lessonPlan(){
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
        Container(
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
                const Text('Date:',style: TextStyle(color: Colors.black,fontSize: 18.5,fontWeight: FontWeight.bold)),
                const SizedBox(width: 7,),
                Container(
                  padding: const EdgeInsets.all(2.7),
                  child: const Text('15.04.2023',
                 style: TextStyle(color: Colors.black,fontSize: 18.5,fontWeight: FontWeight.bold,
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
                const Text('LESSON',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(top: 1),
                  width: double.infinity,
                  child: Text('width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,',
                    overflow: TextOverflow.clip,),
                ),
              ],
            ),
            const SizedBox(height: 8.7,),
            //#learninig outcomes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Learning outcome(s)',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: double.infinity,
                  child: Text('width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,',
                    overflow: TextOverflow.clip,),
                ),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Assessments
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Assessments',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: double.infinity,
                  child: Text('width: double.infinity,'
                      'width: double.infinity,'
                    ,
                    overflow: TextOverflow.clip,),
                ),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Homework to check
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Homework to check',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: double.infinity,
                  child: Text('width: double.infinity,'
                      'width: double.infinity,',
                    overflow: TextOverflow.clip,),
                ),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Main lesson
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Main lesson',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: double.infinity,
                  child: Text('width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,',
                    overflow: TextOverflow.clip,),
                ),

              ],
            ),
            const SizedBox(height: 8.7,),
            //#Homework
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Homework',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: double.infinity,
                  child: Text('width: double.infinity,'
                      'width: double.infinity,'
                      'width: double.infinity,',
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
