import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../controller/edu_plan_list.dart';

class PostLessonPlanPage extends StatefulWidget {
  static const String id = "postLessonPlanPage";
  const PostLessonPlanPage({super.key});

  @override
  State<PostLessonPlanPage> createState() => _PostLessonPlanPageState();
}

class _PostLessonPlanPageState extends State<PostLessonPlanPage> {
  @override
  void initState() {
    super.initState();
    //Get.find<EduLessonPlanController>().apiPostOfLessonPlan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:GetBuilder<EduLessonPlanController>(
        init: EduLessonPlanController(),
        builder: (controller){
          return Form(
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
                        onChanged: (value)=>setState(() => controller.lesson = value),
                      ),
                      const SizedBox(height: 7.0,),
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
                        onChanged: (value)=>setState(() => controller.lesson = value),
                      ),
                      const SizedBox(height: 12.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Select date:',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                          const SizedBox(height: 7.0,),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 100),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.7),
                                color: Colors.white,
                                border: Border.all(width: 1.7,color: Colors.black26)
                            ),
                            height: 60,
                            width: double.infinity,
                            child: Center(
                              child: DateTimePicker(
                                autocorrect: true,
                                //initialValue: '',
                                dateHintText: 'Date',
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2024),
                                onChanged: (val) => print('daatttaaaxacavcdvad: $val'),
                                validator: (value){
                                  if(value != null && value.isEmpty){
                                    return 'Date must not be empty';
                                  }
                                  return null;
                                },
                                // onSaved: (val) => print(val),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7.0,),
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
                        onChanged: (value)=>setState(() => controller.lesson = value),
                      ),
                      const SizedBox(height: 10.0,),
                      const Center(child: Text('Planned activities',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
                      const SizedBox(height: 7.0,),
                      TextFormField(
                        minLines: 1,
                        maxLines: 8,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(color: Colors.blue),
                        decoration:   const InputDecoration(
                            label:Text('Homework to check:',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(0.5))
                            )
                        ),
                        validator: (value){
                          if(value != null && value.isEmpty){
                            return 'Homework to check must not be empty';
                          }
                          return null;
                        },
                        onChanged: (value)=>setState(() => controller.lesson = value),
                      ),
                      const SizedBox(height: 7.0,),
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
                        onChanged: (value)=>setState(() => controller.lesson = value),
                      ),
                      const SizedBox(height: 7.0,),
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
                        onChanged: (value)=>setState(() => controller.lesson = value),
                      ),
                      const SizedBox(height: 7.0,),
                      Center(
                        child: SizedBox(
                          height: 55,
                          width: 380,
                          child: ElevatedButton(
                            onPressed: (){
                              final isValid = controller.formKey.currentState!.validate();
                              if(isValid){

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
          );
        },
      ),
    );
  }
}
