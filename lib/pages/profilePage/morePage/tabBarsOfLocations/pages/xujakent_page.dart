import 'package:flutter/material.dart';
import '../../../../../widget_views/profile/locations/chirchik/chirchik_widget.dart';

class XujakentPage extends StatefulWidget {
  const XujakentPage({super.key});
  static const String id = "XujakentPage";
  @override
  State<XujakentPage> createState() => _XujakentPageState();
}

class _XujakentPageState extends State<XujakentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: const Color(0xFFE1E8ED),
            height: 50,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(width: 1.0,),
                  Text('Date',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  SizedBox(width: 1.0,),
                  Text('Residue',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  SizedBox(width: 1.0,),
                  Text('Received',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  SizedBox(width: 1.0,),
                  Text('Total',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
                  SizedBox(width: 1.0,),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }
}
