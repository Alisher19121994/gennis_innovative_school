import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile_changable_details.dart';
import '../../../pages/profilePage/morePage/model/profile_details_post.dart';

Widget profileDetailsPost(ProfileDetailsController controller,BuildContext context) {
  return Stack(
    children: [
      Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //#edit data
                Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //#dateTime
                      Card(
                        color: const Color(0xFFE1E8ED),
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 55,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropdownButton<String>(
                                  value: controller.selectedDay,
                                  hint: const Text(
                                    'Day',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onChanged: (String? newValue) {
                                    controller.selectedDay = newValue;
                                    controller.isValidDetails(
                                        controller.selectedDay ?? '');
                                  },
                                  items: controller.listOfDay
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<String>(
                                  value: controller.selectedMonth,
                                  hint: const Text(
                                    'Month',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onChanged: (String? newValue) {
                                    controller.selectedMonth = newValue;
                                    controller.isValidDetails(
                                        controller.selectedMonth ?? '');
                                  },
                                  items: controller.listOfMonth
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<String>(
                                  value: controller.selectedYear,
                                  hint: const Text(
                                    'Year',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onChanged: (String? newValue) {
                                    controller.selectedYear = newValue;
                                    controller.isValidDetails(
                                        controller.selectedYear ?? '');
                                  },
                                  items: controller.listOfYear
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      //#username
                      TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              label: Text(
                                'Username',
                                style: TextStyle(color: Colors.blue),
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Username must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                                controller.userName = value,
                                controller
                                    .isValidDetails(controller.userName ?? '')
                              }),
                      const SizedBox(
                        height: 7,
                      ),
                      //#edit data name
                      TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              label: Text(
                                'Name',
                                style: TextStyle(color: Colors.blue),
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Name must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                                controller.name = value,
                                controller.isValidDetails(controller.name ?? '')
                              }),
                      const SizedBox(
                        height: 7,
                      ),
                      //#edit data lastName
                      TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              label: Text(
                                'Last name',
                                style: TextStyle(color: Colors.blue),
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'LastName must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                                controller.lastName = value,
                                controller
                                    .isValidDetails(controller.lastName ?? '')
                              }),
                      const SizedBox(
                        height: 7,
                      ),
                      //#edit data age
                      TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              label: Text(
                                'Father\'s name',
                                style: TextStyle(color: Colors.blue),
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Father\'s name must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                                controller.fathersName = value,
                                controller.isValidDetails(
                                    controller.fathersName ?? '')
                              }),
                      const SizedBox(
                        height: 7,
                      ),
                      //#edit data Phone number
                      TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              label: Text(
                                'Phone number',
                                style: TextStyle(color: Colors.blue),
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Phone number must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                                controller.phoneNumber = value,
                                controller.isValidDetails(
                                    controller.phoneNumber ?? '')
                              }),
                      const SizedBox(
                        height: 7,
                      ),
                      //#edit data Role
                      TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              label: Text(
                                'Role',
                                style: TextStyle(color: Colors.blue),
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Role must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => {
                                controller.role = value,
                                controller.isValidDetails(controller.role ?? '')
                              }),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              final isValid = controller.formKey.currentState!.validate();
                              if (isValid) {
                                ProfileDetailsPost profileDetailsPosts = ProfileDetailsPost(
                                  birthDay: controller.selectedDay,
                                  birthMonth: controller.selectedMonth,
                                  birthYear: controller.selectedYear,
                                  fatherName: controller.fathersName,
                                  name: controller.name,
                                  phone: controller.phoneNumber,
                                  role: controller.role,
                                  selectedSubjects: [],
                                  surname: controller.lastName,
                                  type: controller.type,
                                  username: controller.userName,
                                );
                                Get.find<ProfileDetailsController>().apiPostProfile(profileDetailsPosts,context);
                              }
                            },
                            child: const Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      controller.isLoading
          ? const Center(child: CircularProgressIndicator(),)
          : const SizedBox.shrink(),
    ],
  );
}
