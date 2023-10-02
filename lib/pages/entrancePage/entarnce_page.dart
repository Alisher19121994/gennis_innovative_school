import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../widget_views/entrance_page/entrance_page.dart';
import '../../widget_views/profile/appBar/title.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);
  static const String id = "entrancePage";

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  @override
  void initState() {
    super.initState();
    Get.find<EntranceController>().apiEntranceOfGroups();
    Get.find<EntranceController>().refreshInEntrance();
    Get.find<EntranceController>().startStreaming(context);
    Get.find<EntranceController>().getProfileDate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EntranceController>(
          init: EntranceController(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  backgroundColor: const Color(0xFF00C2FF),
                  elevation: 0,
                  title: titleOfAppBar(context, controller)),
              body: GetBuilder<EntranceController>(
                  init: EntranceController(),
                  builder: (controller) {
                    return Stack(
                      children: [
                        LiquidPullToRefresh(
                          backgroundColor: const Color(0xFF00C2FF),
                          key: controller.refreshIndicatorKey,
                          color: const Color(0xFF00C2FF),
                          onRefresh: () {
                            return controller.refreshInEntrance();
                          },
                          child: ListView.builder(
                            itemCount: controller.listOfGroups.length,
                            itemBuilder: (context, index) {
                              return listOfGroup(context, controller.listOfGroups[index]);
                            },
                          ),
                        ),
                        controller.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink(),
                      ],
                    );
                  }),
            );
          }),
    );
  }
}
