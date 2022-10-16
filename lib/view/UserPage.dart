import 'package:flutter/material.dart';
import 'package:flutter_sqflite/model/UserModel.dart';
import 'package:flutter_sqflite/view_model/StudentViewModel.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final studentViewModel = Get.put(StudentViewModel());
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  int? studentId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(() => Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: firstnameController,
                  decoration: InputDecoration(hintText: 'Enter name'),
                ),
                TextField(
                  controller: lastnameController,
                  decoration: InputDecoration(hintText: 'Enter lastname'),
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(hintText: 'Enter username'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'Enter password'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          if (firstnameController.text != "" &&
                              lastnameController.text != "" &&
                              usernameController.text != "" &&
                              passwordController.text != "") {
                            studentViewModel.addUser(UserModel(
                                id: null,
                                firstName: firstnameController.text,
                                lastName: lastnameController.text,
                                password: passwordController.text,
                                userName: usernameController.text));
                            firstnameController.text = "";
                            lastnameController.text = '';
                            usernameController.text = '';
                            passwordController.text = '';
                          }
                        },
                        child: Text("Add")),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // if (nameController.text != "") {
                          //   studentViewModel.updateStudent(UserModel(
                          //       id: studentId, name: nameController.text));
                          //   nameController.text = "";
                          // }
                        },
                        child: Text("Update"))
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: studentViewModel.allStudent.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              studentId =
                                  studentViewModel.allStudent[index].id!;
                              firstnameController.text =
                                  studentViewModel.allStudent[index].firstName!;
                            },
                            child: Card(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      child: Text(studentViewModel
                                          .allStudent[index].firstName!),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        studentViewModel.deleteStudent(
                                            studentViewModel
                                                .allStudent[index].id!);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 32,
                                      ))
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          )),
    ));
  }
}
