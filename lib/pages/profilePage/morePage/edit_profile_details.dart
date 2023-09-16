import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/profile_page.dart';

class EditProfileDetails extends StatefulWidget {
  static const String id = "editProfileDetails";
  const EditProfileDetails({super.key});

  @override
  State<EditProfileDetails> createState() => _EditProfileDetailsState();
}

class _EditProfileDetailsState extends State<EditProfileDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller){
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //#edit data
                    Container(
                      padding: const EdgeInsets.all(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          const Center(
                            child: Text('Update your profile details',style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                          ),
                          const SizedBox(height: 14,),
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
                          const SizedBox(height: 7,),
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
                          const SizedBox(height: 7,),
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
                          const SizedBox(height: 7,),
                          //#edit data age
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            decoration:  const InputDecoration(
                                label:Text('Age',style: TextStyle(color: Colors.blue),),
                                border: OutlineInputBorder()
                            ),
                            validator: (value){
                              if(value != null && value.isEmpty){
                                return 'Age must not be empty';
                              }
                              return null;
                            },
                            onChanged: (value)=>setState(() => controller.lastName = value),
                          ),
                          const SizedBox(height: 7,),
                          //#edit data Data of birth
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 100),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.7),
                                color: Colors.white,
                                border: Border.all(width: 1.7,color: Colors.black26)
                            ),
                            height: 60,
                            width: double.infinity,
                            child: Center(
                              child: DateTimePicker(
                                autocorrect: true,
                                dateHintText: 'Date of birth',
                                firstDate: DateTime(1970),
                                lastDate: DateTime.now(),
                                onChanged: (val) => print('daatttaaaxacavcdvad: $val'),
                                validator: (value){
                                  if(value != null && value.isEmpty){
                                    return 'Date of birth must not be empty';
                                  }
                                  return null;
                                },
                                // onSaved: (val) => print(val),
                              ),
                            ),
                          ),
                          const SizedBox(height: 7,),
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
                          const SizedBox(height: 7,),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: (){
                                  final isValid = controller.formKey.currentState!.validate();
                                  if(isValid){

                                  }
                                },
                                child: const Center(
                                  child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
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
