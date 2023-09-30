import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile_page.dart';
import '../../../controller/profile_photo.dart';

Widget createImageForProfile(ProfilePhotoController controller) {
  return Stack(
    children: [
      Container(
        height: 550,
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //#edit data picture
              Center(
                child: GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 330,
                    width: 330,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border:
                        Border.all(width: 1.0, color: const Color(0xFF00C2FF))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(150.0),
                      child: controller.imagePath != null
                          ? Image.file(controller.imagePath!,
                        fit: BoxFit.cover,
                        height: 300.0,
                        width: 300.0,)
                            : Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                child: ElevatedButton(
                    onPressed: () {
                     // controller.uploadImages();
                      controller.setProfilePhoto();
                    },
                    child: const Center(
                      child: Text(
                        "Save picture",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      controller.isLoading ? const Center(child: CircularProgressIndicator()): const SizedBox.shrink()
    ],
  );
}
