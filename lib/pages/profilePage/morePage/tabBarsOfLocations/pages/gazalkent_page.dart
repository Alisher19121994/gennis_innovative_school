import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/gazalkent_list.dart';
import 'package:get/get.dart';
import '../../../../../widget_views/profile/locations/chirchik/chirchik_widget.dart';
import '../../model/teachers_salary.dart';

class GazalkentPage extends StatefulWidget {
  const GazalkentPage({super.key});
  static const String id = "GazalkentPage";
  @override
  State<GazalkentPage> createState() => _GazalkentPageState();
}

class _GazalkentPageState extends State<GazalkentPage> {

  @override
  void initState() {
    super.initState();
    Get.find<GazalkentController>().apiGazalkentSalary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<GazalkentController>(
        init: GazalkentController(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                color: const Color(0xFFE1E8ED),
                height: 50,
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(width: 1.0,),
                      Text('Date',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(width: 1.0,),
                      Text('Residue',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(width: 1.0,),
                      Text('Received',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(width: 1.0,),
                      Text('Total',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                      SizedBox(width: 1.0,),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Stack(
              //     children: [
              //       ListView.builder(
              //           itemCount: controller.listOfTeachersSalary.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             DataOfTeachersSalary dataOfTeachersSalary = controller.listOfTeachersSalary[index];
              //             return teachersSalary(dataOfTeachersSalary);
              //           }
              //       ),
              //       controller.isLoading
              //           ? const Center(child: CircularProgressIndicator(),)
              //           : const SizedBox.shrink(),
              //     ],
              //   )
              // )
            ],
          );
        },
      ),
    );
  }
}
