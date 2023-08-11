import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller/entrance_list.dart';
import '../../../projectImages/projectImages.dart';

Widget checkInternet(EntranceController controller ){
  return Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //#cloud image
          Container(
            height: 120,
            width: 150,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ProjectImages.cloud),
                )
            ),
          ),
          //# internet information
          // Center(
          //   child: Text(controller.connectionStatusInEntrance,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
          // ),
        ],
      ),
    ),
  );
}