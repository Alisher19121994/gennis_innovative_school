import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PointList extends StatefulWidget {
  final int ids;
  const PointList({Key? key, required this.ids}) : super(key: key);

 static const String id = "PointList";
  @override
  State<PointList> createState() => _PointListState();
}

Future<String?> ratingUser() async {
  final response = await http.post(
    Uri.parse('http://176.96.243.55/api/make_attendance'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      //'isTypeChecked': students.isTypeChecked,
    }),
  );
  var logger = Logger();
  if (response.statusCode == 200) {
    logger.i(response.body);
    return response.body;
  } else {
    return null;
  }
}

class _PointListState extends State<PointList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Point list',style: TextStyle(fontSize: 40),),),
    );
  }
}
