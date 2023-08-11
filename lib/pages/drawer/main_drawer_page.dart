//import 'dart:html';
import 'package:flutter/material.dart';

import 'headers.dart';
import 'middle_body.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});
  static const String id = 'mainDrawer';
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          TopHeader(),
          MiddleBody()
        ],
      ),
    );
  }
}
