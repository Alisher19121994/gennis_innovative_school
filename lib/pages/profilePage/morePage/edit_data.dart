import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'edit_photo.dart';
import 'edit_profile_details.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);
  static const String id = "editPhoto";

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  @override
  void initState() {
    super.initState();
    //Get.find<ProfileController>().getProfileDate();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF00C2FF),
          elevation: 10,
          //#edit data title
            centerTitle: true,
          title: Row(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(width: 75,),
              Text(
                "Edit Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
            bottom: const TabBar(
              physics: ScrollPhysics(),
                isScrollable: true,
                indicatorColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                tabs: [
                  Tab(
                    child: Text(
                      "Photo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Details",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]
            )
        ),
        body: const TabBarView(
          children: [
            EditPhoto(),
            EditProfileDetails()
          ],
        ),
        // body: GetBuilder<ProfileController>(
        //   init: ProfileController(),
        //   builder: (controller){
        //     return Form(
        //       key: controller.formKey,
        //       child: SingleChildScrollView(
        //         child: Container(
        //           margin: const EdgeInsets.all(12),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             children: [
        //               //#edit data picture
        //               SizedBox(
        //                 height: 150,
        //                 width: double.infinity,
        //                 child: Center(
        //                   child: GestureDetector(
        //                     onTap: () {},
        //                     child: CircleAvatar(
        //                       radius: 100,
        //                       backgroundColor: const Color(0xFFE1E8ED),
        //                       //backgroundImage: NetworkImage(controller.userProfile.user?.photoProfile ?? ''),
        //                       backgroundImage: NetworkImage('https://static.independent.co.uk/2023/07/05/11/SEI162890154.jpg?width=1200&height=900&fit=crop'),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               //#edit data save picture
        //               Container(
        //                 margin: const EdgeInsets.symmetric(horizontal: 70),
        //                 child: TextButton(
        //                     onPressed: () {
        //
        //                     },
        //                     child: const Center(
        //                       child: Text(
        //                         "Save picture",
        //                         style: TextStyle(
        //                             color: Colors.blue,
        //                             fontSize: 18,
        //                             fontWeight: FontWeight.bold),
        //                       ),
        //                     )),
        //               ),
        //               const Divider(thickness: 3,color: Colors.lightBlueAccent,),
        //               //#edit data
        //               Container(
        //                 padding: const EdgeInsets.all(1),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     const SizedBox(height: 10,),
        //                     const Center(
        //                       child: Text('Update your profile details',style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
        //                     ),
        //                     const SizedBox(height: 4,),
        //                     //#edit data username
        //                     TextFormField(
        //                       style: const TextStyle(color: Colors.black),
        //                       decoration:  const InputDecoration(
        //                           label:Text('Username',style: TextStyle(color: Colors.blue),),
        //                           border: OutlineInputBorder()
        //                       ),
        //                       validator: (value){
        //                         if(value != null && value.isEmpty){
        //                           return 'Username must not be empty';
        //                         }
        //                         return null;
        //                       },
        //                       onChanged: (value)=>setState(() => controller.userName = value),
        //                     ),
        //                     const SizedBox(height: 7,),
        //                     //#edit data name
        //                     TextFormField(
        //                       style: const TextStyle(color: Colors.black),
        //                       decoration:  const InputDecoration(
        //                           label:Text('Name',style: TextStyle(color: Colors.blue),),
        //                           border: OutlineInputBorder()
        //                       ),
        //                       validator: (value){
        //                         if(value != null && value.isEmpty){
        //                           return 'Name must not be empty';
        //                         }
        //                         return null;
        //                       },
        //                       onChanged: (value)=>setState(() => controller.name = value),
        //                     ),
        //                     const SizedBox(height: 7,),
        //                     //#edit data lastName
        //                     TextFormField(
        //                       style: const TextStyle(color: Colors.black),
        //                       decoration:  const InputDecoration(
        //                           label:Text('Last name',style: TextStyle(color: Colors.blue),),
        //                           border: OutlineInputBorder()
        //                       ),
        //                       validator: (value){
        //                         if(value != null && value.isEmpty){
        //                           return 'LastName must not be empty';
        //                         }
        //                         return null;
        //                       },
        //                       onChanged: (value)=>setState(() => controller.lastName = value),
        //                     ),
        //                     const SizedBox(height: 7,),
        //                     //#edit data Data of birth
        //                     Container(
        //                       padding: const EdgeInsets.all(10),
        //                       margin: const EdgeInsets.only(right: 100),
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(1.7),
        //                           color: Colors.white,
        //                           border: Border.all(width: 1.7,color: Colors.black26)
        //                       ),
        //                       height: 60,
        //                       width: double.infinity,
        //                       child: Center(
        //                         child: DateTimePicker(
        //                           autocorrect: true,
        //                           dateHintText: 'Date of birth',
        //                           firstDate: DateTime(1970),
        //                           lastDate: DateTime.now(),
        //                           onChanged: (val) => print('daatttaaaxacavcdvad: $val'),
        //                           validator: (value){
        //                             if(value != null && value.isEmpty){
        //                               return 'Date of birth must not be empty';
        //                             }
        //                             return null;
        //                           },
        //                           // onSaved: (val) => print(val),
        //                         ),
        //                       ),
        //                     ),
        //                     const SizedBox(height: 7,),
        //                     //#edit data Phone number
        //                     TextFormField(
        //                       style: const TextStyle(color: Colors.black),
        //                       decoration:  const InputDecoration(
        //                           label:Text('Phone number',style: TextStyle(color: Colors.blue),),
        //                           border: OutlineInputBorder()
        //                       ),
        //                       validator: (value){
        //                         if(value != null && value.isEmpty){
        //                           return 'Phone number must not be empty';
        //                         }
        //                         return null;
        //                       },
        //                       onChanged: (value)=>setState(() => controller.phoneNumber = value),
        //                     ),
        //                     const SizedBox(height: 7,),
        //                     Container(
        //                       margin: const EdgeInsets.symmetric(horizontal: 80),
        //                       height: 50,
        //                       child: ElevatedButton(
        //                           onPressed: (){
        //                             final isValid = controller.formKey.currentState!.validate();
        //                             if(isValid){
        //
        //                             }
        //                           },
        //                           child: const Center(
        //                             child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        //                           )
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // )
      ),
    );
  }
}
