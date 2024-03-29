import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:get/get.dart';
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
                        ListView.builder(
                          itemCount: controller.listOfGroups.length,
                          itemBuilder: (context, index) {
                            return listOfGroup(context, controller,index,controller.listOfGroups[index]);
                          },
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
