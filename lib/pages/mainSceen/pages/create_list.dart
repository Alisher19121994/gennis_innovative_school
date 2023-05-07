import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CreateList extends StatefulWidget {
  const CreateList({Key? key}) : super(key: key);
  static const String id = "createList";

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {

  var isSelectedChecked = false;
  var isSelectedUnChecked = false;

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _listOfStudents(),
                  _listOfStudents(),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 5),
              child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    side: const BorderSide(width: 2,color: Colors.white)
                ),
                child: const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      )

    );
  }
  Widget _listOfStudents(){

    return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                //#fullname
              SizedBox(
                width: 100,
                child: Column(
                  children: const [
                    Text("Alisher",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("Daminov",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
                const SizedBox(width: 10,),
                //#checked points and available students
                Expanded(
                    child:Column(
                      children: [
                        //#ratings checked points
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //#point title
                              Container(
                                height: 38,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.cyanAccent
                                ),
                                child: const Center(
                                  child: Text("Point",style: TextStyle(color: Colors.black,fontSize: 18),),
                                ),
                              ),
                              //#ratings checked points
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 0.7),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star, color: Colors.amber,),
                                  onRatingUpdate: (rating) {
                                 // value = rating;
                                  print(rating);
                                  // Rating rating = Rating(rating);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                        const SizedBox(height: 25,),
                       //#available students
                        Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         //#checked title
                         Container(
                           height: 38,
                           width: 70,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(4),
                             color: Colors.cyanAccent
                           ),
                           child: const Center(
                             child: Text("Check",style: TextStyle(color: Colors.black,fontSize: 18),),
                           ),
                         ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         //#checked or unchecked green
                         isSelectedChecked ?  Container(
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(5),
                                 color: Colors.green
                             ),
                             child:  Center(
                               child: IconButton(
                                 onPressed: (){
                                   setState(() {
                                     isSelectedChecked = false;
                                   });
                                 },
                                 icon: const Icon(Icons.check,color: Colors.white,size: 37,),
                               ),
                               // child: Icon(Icons.check,color: Colors.white,size: 37,),
                             ),
                           )
                               : Container(
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(5),
                                 color: Colors.black12
                             ),
                             child:  Center(
                               child: IconButton(
                                 onPressed: (){
                                   setState(() {
                                     isSelectedChecked = true;
                                   });
                                 },
                                 icon: const Icon(Icons.check,color: Colors.white,size: 37,),
                               ),
                             ),
                           ) ,
                         const SizedBox(width: 60,),

                         //#checked or unchecked red
                         isSelectedUnChecked ?  Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   color: Colors.red
                               ),
                               child:  Center(
                                 child: IconButton(
                                   onPressed: (){
                                     setState(() {
                                       isSelectedUnChecked = false;
                                     });
                                   },
                                   icon: const Icon(Icons.close_sharp,color: Colors.white,size: 37,),
                                 ),
                                 // child: Icon(Icons.check,color: Colors.white,size: 37,),
                               ),
                             )
                                 : Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   color: Colors.black12
                               ),
                                   child:  Center(
                                     child: IconButton(
                                       onPressed: (){
                                         setState(() {
                                          isSelectedUnChecked = true;
                                        });
                                      },
                                         icon: const Icon(Icons.close_sharp,color: Colors.white,size: 37,),
                                 ),
                               ),
                             ) ,
                         const SizedBox(width: 28,),
                       ],
                     ),


                       ],
                     ),
                      ],
                    )
                )
              ],
            ),
            const SizedBox(height: 5,),
            const Divider(thickness: 1,)
          ],
        )
      ),
    );
  }
}
