import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/chirchik_list.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../widget_views/profile/locations/chirchik/chirchik_widget.dart';
import '../../../../../widget_views/profile/locations/chirchik/main_page.dart';
import '../../model/teachers_salary.dart';

class ChirchikPage extends StatefulWidget {
  const ChirchikPage({super.key});
  static const String id = "chirchikPage";

  @override
  State<ChirchikPage> createState() => _ChirchikPageState();
}

class _ChirchikPageState extends State<ChirchikPage> {
  @override
  void initState() {
    super.initState();
    Get.find<ChirchikController>().apiChirchikSalary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ChirchikController>(
        init: ChirchikController(),
        builder: (controller){
          return chirchikSalary(controller);
        }
      ),
    );
  }
}

