import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/profile_page.dart';

class EditPhoto extends StatefulWidget {
  const EditPhoto({Key? key}) : super(key: key);
  static const String id = "editPhoto";
  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller){
            return Container(
              margin: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //#edit data picture
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Center(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: CircleAvatar(
                              radius: 150,
                              backgroundColor: const Color(0xFFE1E8ED),
                              //backgroundImage: NetworkImage(controller.userProfile.user?.photoProfile ?? ''),
                              backgroundImage: NetworkImage('https://static.independent.co.uk/2023/07/05/11/SEI162890154.jpg?width=1200&height=900&fit=crop'),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  //#edit data save picture
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    child: MaterialButton(
                        onPressed: () {

                        },
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
          },
        )
    );
  }
}
