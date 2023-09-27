import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../controller/edu_plan_list.dart';
import '../../../../../widget_views/edu_plan/post_edu_plan/post_edu_plan.dart';
import '../../attendanceList/model/lesson_plan_post.dart';

class PostLessonPlanPage extends StatefulWidget {
  static const String id = "postLessonPlanPage";
  final int postLessonPlanId;
  const PostLessonPlanPage({super.key, required this.postLessonPlanId});

  @override
  State<PostLessonPlanPage> createState() => _PostLessonPlanPageState();
}

class _PostLessonPlanPageState extends State<PostLessonPlanPage> {
  LessonPlanPost lessonPlanPost = LessonPlanPost();
  @override
  void initState() {
    super.initState();
    Get.find<EduLessonPlanController>().apiPostLessonPlan(widget.postLessonPlanId,lessonPlanPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:GetBuilder<EduLessonPlanController>(
        init: EduLessonPlanController(),
        builder: (controller){
        return postEduPlan(controller,widget.postLessonPlanId);
        },
      ),
    );
  }
}
