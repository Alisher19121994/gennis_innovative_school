import 'package:flutter/cupertino.dart';
import 'package:gennis_innovative_school/widget_views/entrance_page/shimmerLoadings/loading.dart';
/*
* ListViewIsLoading creates that, while the main data is being received, just loading as shimmer!!
* */
Widget listViewIsLoading(){
  return Expanded(
      child: ListView.separated(
          itemBuilder: (context,index) => shimmerLoading(),
          separatorBuilder: (context,index) => const SizedBox(height: 10,),
          itemCount: 5));
}