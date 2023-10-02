import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/edu_plan_list.dart';
import '../../../pages/mainSceen/pages/attendanceList/model/lesson_plan_post.dart';

Widget postEduPlan(EduLessonPlanController controller, int postLessonPlanId,BuildContext context){
  return Stack(
    children: [
      Form(
          key: controller.formKey,
          child: Container(
            margin: const EdgeInsets.only(left: 1.7,right: 1.7,top: 2.0),
            padding: const EdgeInsets.all(1.7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 3.0,),
                  //#lesson
                  TextFormField(
                    minLines: 1,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.blue),
                    decoration:   const InputDecoration(
                        label:Text('Lesson:',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.5))
                        )
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Lesson must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>{
                      controller.isValidData( controller.lesson = value)
                    }
                  ),
                  const SizedBox(height: 7.0,),
                  //#Learning outcome(s)
                  TextFormField(
                    minLines: 1,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.blue),
                    decoration:   const InputDecoration(
                        label:Text('Learning outcome(s):',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.5))
                        )
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Learning outcome(s) must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>{
                      controller.isValidData( controller.lessonTarget = value)
                    }),
                  const SizedBox(height: 7.0,),
                  //#Assessment
                  TextFormField(
                    minLines: 1,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.blue),
                    decoration:   const InputDecoration(
                        label:Text('Assessment:',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.5))
                        )
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Assessment must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>{
                      controller.isValidData( controller.assessment = value)
                    }

                  ),
                  const SizedBox(height: 10.0,),
                  const Center(child: Text('Planned activities',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
                  const SizedBox(height: 7.0,),
                  //#Main lesson
                  TextFormField(
                    minLines: 1,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.blue),
                    decoration:   const InputDecoration(
                        label:Text('Main lesson:',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.5))
                        )
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Main lesson must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>{
                      controller.isValidData( controller.mainLesson = value)
                    }
                  ),
                  const SizedBox(height: 7.0,),
                  //#Homework
                  TextFormField(
                    minLines: 1,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.blue),
                    decoration:   const InputDecoration(
                        label:Text('Homework:',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.5))
                        )
                    ),
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Homework must not be empty';
                      }
                      return null;
                    },
                    onChanged: (value)=>{
                      controller.isValidData( controller.homework = value)
                    }
                  ),
                  const SizedBox(height: 7.0,),
                  //#Submit
                  Center(
                    child: SizedBox(
                      height: 55,
                      width: 380,
                      child: ElevatedButton(
                        onPressed: (){
                          final isValid = controller.formKey.currentState!.validate();
                          if(isValid){
                            LessonPlanPost lessonPlanPosts = LessonPlanPost(lessonPlan: LessonPlan(
                                    lessonName: controller.lesson,
                                    lessonTarget: controller.lessonTarget,
                                    assessment:controller.assessment ,
                                    mainLesson: controller.mainLesson,
                                    newHomework: controller.homework));
                            Get.find<EduLessonPlanController>().apiPostLessonPlan(postLessonPlanId,lessonPlanPosts,context);
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 1, color: Colors.white)),
                        child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22.0,),
                ],
              ),
            ),
          )
      ),
      controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox.shrink(),
    ],
  );
}