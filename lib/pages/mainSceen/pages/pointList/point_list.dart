import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gennis_innovative_school/controller/point_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../../../widget_views/point_list/point_page.dart';
import '../usersList/model/users.dart';

class PointList extends StatefulWidget {
  final int ids;
  const PointList({Key? key, required this.ids}) : super(key: key);

 static const String id = "PointList";
  @override
  State<PointList> createState() => _PointListState();
}
class _PointListState extends State<PointList> {
  @override
  void initState() {
    super.initState();
    Get.find<PointListController>().apiPointListOfStudents(widget.ids);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 2),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
              child:GetBuilder<PointListController>(
              init: PointListController(),
               builder: (controller){
                return Stack(
                children:[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listOfStudents.length,
                    itemBuilder:(BuildContext context,int index){
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(radius: 50,backgroundImage: NetworkImage(controller.listOfStudents[index].photoProfile??''),),
                          title: Text(controller.listOfStudents[index].surname??'',style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Text(controller.listOfStudents[index].name??'',style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                          trailing: RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 44,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
                            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,),
                            onRatingUpdate: (rating) {
                              print(rating.toInt());
                              //listOfUsers[index].money = rating.toInt();
                            },
                          ),
                        ),
                      );
                     // return pointList(controller,index);
                    },
                  ),
                  controller.isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink(),
                ]
            );
          },
      ),
          ),
              SizedBox(
                height: 55,
                width: 230,
                child: ElevatedButton(
                  onPressed: () {
//               List<String> selectedItems = [];
//               _checkedItems.forEach((key, value) {
//                 if (value) {
//                   selectedItems.add(key);
//                 }
//               });
//               print(selectedItems);
//             },
                    List<String> selectedItems = [];
                    // _checkedItems.forEach((key, value) {
                    // if (value) {
                    //  selectedItems.add(key);
                    //         }});
                    // setState(() {
                    //   _selectedDate = DateTime.now();
                    // });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 2, color: Colors.white)),
                  child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


