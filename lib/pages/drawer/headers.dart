import 'package:flutter/material.dart';

import '../../projectImages/projectImages.dart';

class TopHeader extends StatefulWidget {
  const TopHeader({super.key});
  static const String id = 'headers';
  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
     color: const Color(0xFF00C2FF),
        child: DrawerHeader(
          child: SizedBox(
                height: 70,
                width: double.infinity,
                child: Image.asset(ProjectImages.topLogo),
              ),
        ),
    );
  }
}
