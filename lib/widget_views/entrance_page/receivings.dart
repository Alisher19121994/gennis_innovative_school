import 'package:flutter/cupertino.dart';
import '../../controller/entrance_list.dart';
import 'entrance_page.dart';
/*
* Widget isDataReceived is the main listOfGroups data from server, in which the user can see his/her groups with numbers!!!
* */
Widget isDataReceived(EntranceController controller){
  return ListView.builder(
      itemCount: controller.listOfGroups?.length,
      itemBuilder: (context, index) {
        return listOfGroup(context, controller.listOfGroups![index]);
      },
    );
}