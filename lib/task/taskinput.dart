import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:student_app/TaskPage.dart';
import 'package:group_student_app_1/task/TaskPage.dart';

class Task {
  String id;
  final String Name;
  final String Description;

  Task({
    this.id = '',
    required this.Name,
    required this.Description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Name': Name,
        'Description': Description,
      };
}

class TaskInputPage extends StatefulWidget {
  @override
  _TaskInputPageState createState() => _TaskInputPageState();
}

class _TaskInputPageState extends State<TaskInputPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController description = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "YOUR TASK",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 185,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height - 210,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Material(
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        enabled: true,
                        hintText: 'The New Task',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Material(
                    child: TextField(
                      controller: description,
                      decoration: InputDecoration(
                        enabled: true,
                        hintText: 'xxxxxxxxxxxxxxxx',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> data = {
                        "Name": name.text,
                        "Description": description.text
                      };
                      FirebaseFirestore.instance.collection("Task").add(data);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 17, 0, 255),
                      padding: EdgeInsets.all(10),
                      minimumSize: Size(10, 50),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Discard',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Color.fromARGB(255, 17, 0, 255),
                      side: BorderSide(width: 2),
                      padding: EdgeInsets.all(10),
                      minimumSize: Size(10, 50),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
