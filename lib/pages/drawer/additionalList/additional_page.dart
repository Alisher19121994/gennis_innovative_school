import 'package:flutter/material.dart';

class AdditonalPage extends StatefulWidget {
  const AdditonalPage({super.key});
 static const String id = 'additonalPage';
  @override
  State<AdditonalPage> createState() => _AdditonalPageState();
}

class _AdditonalPageState extends State<AdditonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AdditonalPage',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
