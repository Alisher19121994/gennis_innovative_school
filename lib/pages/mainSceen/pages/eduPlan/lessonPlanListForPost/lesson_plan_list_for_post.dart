import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../../../controller/lesson_plan_list.dart';
import '../../../../../widget_views/attendance/lesson_plan.dart';
import '../modelLessonPlan/lesson_plan_list.dart';

class LessonPlanListForPost extends StatefulWidget {
  final int ids;

  const LessonPlanListForPost({super.key, required this.ids});

  static const String id = "lessonPlanListForPost";

  @override
  State<LessonPlanListForPost> createState() => _LessonPlanListForPostState();
}

class _LessonPlanListForPostState extends State<LessonPlanListForPost> {
  @override
  void initState() {
    super.initState();
    Get.find<LessonPlanPostListsController>().apiLessonPlanList(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LessonPlanPostListsController>(
        init: LessonPlanPostListsController(),
        builder: (controller) {
          return Stack(
            children: [
              LiquidPullToRefresh(
                  backgroundColor: const Color(0xFF00C2FF),
                  key: controller.refreshIndicatorKey,
                  color: const Color(0xFF00C2FF),
                  onRefresh: () {
                    return controller.refreshInLessonPlanPostListsController();
                  },
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0),
                      itemCount: controller.planList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        PlanList planList = controller.planList[index];
                        return createLessonPlan(context, planList);
                      })),
              controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
