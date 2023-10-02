import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/chirchik_list.dart';
import '../../../../pages/profilePage/morePage/model/teachers_salary.dart';
import 'chirchik_widget.dart';

Widget chirchikSalary(ChirchikController controller){
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
      Expanded(
          child:Stack(
            children: [
              ListView.builder(
                  itemCount: controller.listOfTeachersSalary.length,
                  itemBuilder: (BuildContext context, int index) {
                    DataOfTeachersSalary dataOfTeachersSalary = controller.listOfTeachersSalary[index];
                    return teachersSalary(dataOfTeachersSalary);
                  }
              ),
              controller.isLoading
                  ? const Center(child: CircularProgressIndicator(),)
                  : const SizedBox.shrink(),
            ],
          )
      )
    ],
  );
}