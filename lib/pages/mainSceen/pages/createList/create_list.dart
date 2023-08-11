
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/create_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import '../../../../logService/log_service.dart';
import 'model/user_data.dart';

class CheckList extends StatefulWidget {
  final int ids;

  const CheckList({Key? key, required this.ids}) : super(key: key);
  static const String id = "createList";

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  int? selectedDay;
  String? selectedMonth;
  final Connectivity connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    Get.find<CreateController>().apiCreateListOfStudents(widget.ids);
  }
  void updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text('PLEASE CONNECT TO THE INTERNET', style: TextStyle(color: Colors.black, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 0.8),
          child: GetBuilder<CreateController>(
            init: CreateController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 495,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: controller.listOfStudents.length,
                          itemBuilder: (context, index) {
                            //return listOfUsers(controller.listOfStudents[index] as CreateController, index);
                            return Card(
                              borderOnForeground: true,
                              color: Colors.cyanAccent,
                              child: ListTile(
                                leading: Text(
                                  controller.listOfStudents[index].surname ??
                                      '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                title: Text(
                                  controller.listOfStudents[index].name ?? '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                trailing: Transform.scale(
                                  scale: 1.8,
                                  child: Checkbox(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    value: controller.listOfStudents[index].typeChecked == 'yes',
                                    onChanged: (selected) {
                                      setState(() {
                                        if(selected == true){
                                          setState(() {
                                            controller.listOfStudents[index].typeChecked = 'yes';
                                            print(controller.listOfStudents[index].typeChecked = 'yes');
                                          });

                                        }else{
                                          setState(() {
                                            controller.listOfStudents[index].typeChecked = 'no';
                                            print(controller.listOfStudents[index].typeChecked = 'no');
                                          });
                                        }
                                      });
                                    },
                                    autofocus: false,
                                    checkColor: Colors.white,
                                    activeColor: Colors.blue,
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3.5),),),
                                    tristate: true,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        controller.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120,),
                  SizedBox(
                    height: 90,
                    child: Card(
                      color: Colors.cyanAccent,
                      child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //#dateTime
                              SizedBox(
                                  height: 55,
                                  width: 180,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DropdownButton<int>(
                                        value:selectedDay,
                                        hint: const Text('Day',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                        onChanged: (int? newValue) {
                                          setState(() {
                                            selectedDay = newValue!;
                                            print(selectedDay);
                                          });
                                        },
                                        items: controller.listOfDay.map<DropdownMenuItem<int>>((int value) {
                                          return DropdownMenuItem<int>(value: value, child: Text(value.toString()),);}).toList(),
                                      ),
                                      DropdownButton<String>(
                                        value: selectedMonth,
                                        hint: const Text('Month',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedMonth = newValue!;
                                            print(selectedMonth);
                                          });
                                        },
                                        items: controller.listOfMonth.map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                                      )
                                    ],
                                  )),
                              const SizedBox(width: 70,),
                              //#submit button
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  width: 120,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      for (var studentsList in controller.listOfStudents) {
                                        Students students = Students(
                                            age: studentsList.age,
                                            attended: studentsList.attended,
                                            comment: studentsList.comment,
                                            date: Date(day: selectedDay!, month: selectedMonth.toString()),
                                            id: studentsList.id,
                                            img: studentsList.img,
                                            money: studentsList.money,
                                            moneyType: studentsList.moneyType,
                                            name: studentsList.name,
                                            phone: studentsList.phone,
                                            photoProfile: studentsList.photoProfile,
                                            reason: studentsList.reason,
                                            regDate: studentsList.regDate,
                                            role: studentsList.role,
                                            scores: Scores(),
                                            surname: studentsList.surname,
                                            typeChecked: studentsList.typeChecked,
                                            username: studentsList.username);
                                        List<Students> student = [students];
                                        controller.userList = UserList(groupID: controller.userList.groupID, data: DataList(students: student));
                                      //  controller.attendance = Attendance(groupId: controller.attendance.groupId,student: students);
                                      }
                                      LogService.warning("${controller.userList}");
                                      Get.find<CreateController>().apiPostOfStudentsAttendance(controller.userList);
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 2, color: Colors.white)),
                                    child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

/*
  * import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _connectionStatus = 'Unknown';

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    ConnectivityResult result;
    try {
      result = await Connectivity().checkConnectivity();
    } catch (e) {
      print(e.toString());
    }

    if (mounted) {
      setState(() {
        switch (result) {
          case ConnectivityResult.none:
            _connectionStatus = 'No Internet';
            break;
          case ConnectivityResult.mobile:
            _connectionStatus = 'Mobile Connection';
            break;
          case ConnectivityResult.wifi:
            _connectionStatus = 'WiFi Connection';
            break;
          default:
            _connectionStatus = 'Unknown';
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Internet Connection'),
        ),
        body: Center(
          child: Text(
            'Connection Status: $_connectionStatus',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

  * **/
}
