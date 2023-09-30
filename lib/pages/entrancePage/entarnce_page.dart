import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../networkService/network_service.dart';
import '../../widget_views/entrance_page/entrance_page.dart';
import '../../widget_views/profile/appBar/title.dart';
import '../registration/model/login_response.dart';
import 'model/group_info.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);
  static const String id = "entrancePage";

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      dialogBuilder(context);
    }
  }

  Future<void> dialogBuilder(BuildContext context) {
    return Dialogs.materialDialog(
        barrierDismissible: false,
        color: Colors.red,
        msg: 'Please, connect to the internet',
        title: 'ERROR',
        customViewPosition: CustomViewPosition.BEFORE_ACTION,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              checkInternet();
              Navigator.of(context).pop();
            },
            text: 'Try again',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  startStreaming() async {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  @override
  void initState() {
    super.initState();
    startStreaming();
    Get.find<EntranceController>().apiEntranceOfGroups();
    Get.find<EntranceController>().refreshInEntrance();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntranceController>(
        init: EntranceController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: const Color(0xFF00C2FF),
                elevation: 0,
                title: titleOfAppBar(context, controller.listOfGroups[0],)),
            body:Stack(
              children: [
                LiquidPullToRefresh(
                  backgroundColor: const Color(0xFF00C2FF),
                  key: controller.refreshIndicatorKey,
                  color:const Color(0xFF00C2FF),
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
            ),
        );
      }
    );
  }
}
