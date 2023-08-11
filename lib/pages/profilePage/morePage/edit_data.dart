import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
    Get.find<ProfileController>().getProfileDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C2FF),
        elevation: 0,
        //#edit data title
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Edit Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ],
        ),
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller){
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //#edit data picture
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.black26,
                            backgroundImage: NetworkImage(controller.userProfile.user?.photoProfile ?? ''),
                          ),
                        ),
                      ),
                    ),
                    //#edit data save picture
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      child: TextButton(
                          onPressed: () {

                          },
                          child: const Center(
                            child: Text(
                              "Save picture",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    //#edit data
                    Container(
                      padding: const EdgeInsets.all(13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //#edit data username
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration:  const InputDecoration(
                                label:Text('Username',style: TextStyle(color: Colors.blue),),
                                border: OutlineInputBorder()
                            ),
                            validator: (value){
                              if(value != null && value.isEmpty){
                                return 'Username must not be empty';
                              }
                              return null;
                            },
                            onChanged: (value)=>setState(() => controller.userName = value),
                          ),
                          const SizedBox(height: 10,),
                          //#edit data name
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration:  const InputDecoration(
                                label:Text('Name',style: TextStyle(color: Colors.blue),),
                                border: OutlineInputBorder()
                            ),
                            validator: (value){
                              if(value != null && value.isEmpty){
                                return 'Name must not be empty';
                              }
                              return null;
                            },
                            onChanged: (value)=>setState(() => controller.name = value),
                          ),
                          const SizedBox(height: 10,),
                          //#edit data lastName
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration:  const InputDecoration(
                                label:Text('Last name',style: TextStyle(color: Colors.blue),),
                                border: OutlineInputBorder()
                            ),
                            validator: (value){
                              if(value != null && value.isEmpty){
                                return 'LastName must not be empty';
                              }
                              return null;
                            },
                            onChanged: (value)=>setState(() => controller.lastName = value),
                          ),
                          const SizedBox(height: 10,),
                          //#edit data Data of birth
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration:  const InputDecoration(
                                label:Text('Data of birth',style: TextStyle(color: Colors.blue),),
                                border: OutlineInputBorder()
                            ),
                            validator: (value){
                              if(value != null && value.isEmpty){
                                return 'Data of birth must not be empty';
                              }
                              return null;
                            },
                            onChanged: (value)=>setState(() => controller.dateOfBirth = value),
                          ),
                          const SizedBox(height: 10,),
                          //#edit data Phone number
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration:  const InputDecoration(
                                label:Text('Phone number',style: TextStyle(color: Colors.blue),),
                                border: OutlineInputBorder()
                            ),
                            validator: (value){
                              if(value != null && value.isEmpty){
                                return 'Phone number must not be empty';
                              }
                              return null;
                            },
                            onChanged: (value)=>setState(() => controller.phoneNumber = value),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 80),
                            height: 50,
                            child: ElevatedButton(
                                onPressed: (){
                                  final isValid = controller.formKey.currentState!.validate();
                                  if(isValid){

                                  }
                                },
                                child: const Center(
                                  child: Text("Save data",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
