import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* this is a Widget loading() that the shimmer loading ui in the entrance page, once before data received!!!
* */
Widget shimmerLoading() {
  return Card(
    color: Colors.black12,
    child: Container(
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //#subject
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 30,
          ),
          const SizedBox(height: 10,),
          //#title
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 30,
          ),
        ],
      ),
    ),
  );
}