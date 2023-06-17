import 'package:flutter/material.dart';

class EduPlanList extends StatefulWidget {
  final int ids;
  const EduPlanList({Key? key, required this.ids}) : super(key: key);
  static const String id = "eduPlanList";

  @override
  State<EduPlanList> createState() => _EduPlanListState();
}

class _EduPlanListState extends State<EduPlanList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
      child: Text("EduPlanList"),
    ),);
  }
}
