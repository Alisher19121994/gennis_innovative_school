import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/profile_page.dart';

Widget createImageForProfile(ProfileController controller) {
  return Container(
    margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //#edit data picture
        Center(
          child: GestureDetector(
            onTap: () {
              controller.pickImage();
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(4.0),
              height: 330,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF00C2FF))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(150.0),
                  child: controller.pickedFile != null
                      ? Image.file(
                          File(controller.pickedFile!.path),
                          fit: BoxFit.cover,
                          height: 300.0,
                          width: 300.0,
                        )
                      : Center(
                          child: Center(
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.image,
                                  size: 100,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Select image',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        )),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        //#edit data save picture
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 70),
          child: MaterialButton(
              onPressed: () {},
              child: const Center(
                child: Text(
                  "Save picture",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ],
    ),
  );
}
