// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:student_app/taskinput.dart';
import 'package:group_student_app_1/task/taskinput.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
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
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 150,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: MediaQuery.of(context).size.height - 210,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskInputPage()),
                    );
                  },
                  child: Text(
                    "New Task",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(width: 2),
                    padding: EdgeInsets.all(10),
                    minimumSize: Size(10, 150),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
