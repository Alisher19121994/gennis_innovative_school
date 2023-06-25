import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/create_list.dart';

Widget listOfUsers(CreateController controller,int index){
  return Card(
    borderOnForeground: true,
    color: Colors.cyanAccent,
    child: ListTile(
      leading:  Text(controller.listOfStudents[index].surname ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      title: Text(controller.listOfStudents[index].name ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      trailing: Transform.scale(
        scale: 2.2,
        child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: controller.listOfStudents[index].isTypeChecked,
          onChanged: (value) {
           // setState(() {
              controller.listOfStudents[index].isTypeChecked = value;
           // });
          },
          checkColor: Colors.white,
          activeColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),

          tristate: true,
        ),
      ),

    ),
  );
}