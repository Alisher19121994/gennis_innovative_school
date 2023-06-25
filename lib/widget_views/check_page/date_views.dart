import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
//
// Widget dateOfUsers(){
//   //#submit button
//   return Container(
//         height: 80,
//         color: Colors.cyanAccent,
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(width: 20,),
//             SizedBox(
//               height: 100,
//               child: ScrollDatePicker(
//                 selectedDate: _selectedDate,
//                 locale: const Locale('en'),
//                 scrollViewOptions: const DatePickerScrollViewOptions(
//                   year: ScrollViewDetailOptions(margin: EdgeInsets.only(right: 8),),
//                   month: ScrollViewDetailOptions(margin: EdgeInsets.only(right: 8),),),
//                 onDateTimeChanged: (DateTime value) {
//                   setState(() {
//                     _selectedDate = value;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(width: 70,),
//             //#submit button
//             Expanded(
//               child: SizedBox(
//                 height: 55,
//                 width: 100,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     List<String> selectedItems = [];
//                     // _checkedItems.forEach((key, value) {
//                     // if (value) {
//                     //  selectedItems.add(key);
//                     //         }});
//                     setState(() {
//                       _selectedDate = DateTime.now();
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.lightBlueAccent,
//                       side: const BorderSide(
//                           width: 2, color: Colors.white)),
//                   child: const Text(
//                     "Submit",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 19,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )),
// }