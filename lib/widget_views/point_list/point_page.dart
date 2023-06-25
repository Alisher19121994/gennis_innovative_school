import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../controller/point_list.dart';

Widget pointList(PointListController controller,int index){
  return Card(
    color: Colors.cyanAccent,
    child: ListTile(
      leading: CircleAvatar(radius: 45,backgroundImage: NetworkImage(controller.listOfStudents[index].photoProfile??''),),
      title: Text(controller.listOfStudents[index].surname??'',style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
      subtitle: Text(controller.listOfStudents[index].name??'',style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
      trailing: RatingBar.builder(
        initialRating: 0,
        minRating: 1,
        direction: Axis.horizontal,
        itemCount: 5,
        itemSize: 36,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,),
        onRatingUpdate: (rating) {
          print(rating.toInt());
          //listOfUsers[index].money = rating.toInt();
        },
      ),
    ),
  );
}