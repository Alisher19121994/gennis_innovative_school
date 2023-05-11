import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);
  static const String id = "editPhoto";

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  final  formKey = GlobalKey<FormState>();
  late String userName;
  late String name;
  late String lastName;
  late String dateOfBirth;
  late String phoneNumber;

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
      body: Form(
        key: formKey,
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
                      child: const CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.black26,
                        backgroundImage: NetworkImage(
                            "https://www.pngitem.com/pimgs/m/106-1068071_black-person-png-black-man-business-png-transparent.png"),
                      ),
                    ),
                  ),
                ),
                //#edit data save picture
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  child: TextButton(
                      onPressed: () {},
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
                        onChanged: (value)=>setState(() =>userName = value),
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
                        onChanged: (value)=>setState(() =>name = value),
                      ),
                      const SizedBox(height: 10,),
                      //#edit data lastName
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration:  const InputDecoration(
                            label:Text('LastName',style: TextStyle(color: Colors.blue),),
                            border: OutlineInputBorder()
                        ),
                        validator: (value){
                          if(value != null && value.isEmpty){
                            return 'LastName must not be empty';
                          }
                          return null;
                        },
                        onChanged: (value)=>setState(() =>lastName = value),
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
                        onChanged: (value)=>setState(() =>dateOfBirth = value),
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
                        onChanged: (value)=>setState(() =>phoneNumber = value),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 80),
                        height: 50,
                        child: ElevatedButton(
                            onPressed: (){
                              final isValid = formKey.currentState!.validate();
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
      ),
    );
  }
}
