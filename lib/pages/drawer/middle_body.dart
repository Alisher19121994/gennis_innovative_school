import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/drawer/widgets/category_additional.dart';
import 'package:gennis_innovative_school/pages/drawer/widgets/category_content.dart';
import 'package:gennis_innovative_school/pages/drawer/widgets/category_information.dart';

class MiddleBody extends StatefulWidget {
  const MiddleBody({super.key});

  @override
  State<MiddleBody> createState() => _MiddleBodyState();
}

class _MiddleBodyState extends State<MiddleBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          categoryOfInformation('Information',Colors.black),
          categoryOfContent('Content',Colors.black),
          categoryOfAdditional('Additional',Colors.black),
        ],
      ),

    );
  }
}
