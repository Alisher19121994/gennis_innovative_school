import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contentList/content_page.dart';

Widget categoryOfContent(String title,[Color colors = Colors.black]){
  return GestureDetector(
    onTap: (){
      Get.to(const ContentPage());
    },
    child: Container(
      height: 40,
      margin:const EdgeInsets.only(left: 5,right: 5,top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black12
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(Icons.content_copy_rounded),
                const SizedBox(width: 5,),
                Text(title,style: TextStyle(color: colors,fontSize: 16,fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}