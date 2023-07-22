import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import '../../controller/create_list.dart';

Widget listOfUsers(CreateController controller, int index) {
  return Card(
    borderOnForeground: true,
    color: Colors.cyanAccent,
    child: ListTile(
      leading: Text(
        controller.listOfStudents[index].surname ?? '',
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      title: Text(
        controller.listOfStudents[index].name ?? '',
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      trailing: Transform.scale(
        scale: 1.8,
        child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: controller.listOfStudents[index].typeChecked =='no',
          onChanged: (_) =>
              controller.toggleStudentSelection((controller.listOfStudents[index].typeChecked =='yes') as Students),
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
