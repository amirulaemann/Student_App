import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskHomepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<TaskHomepage> {
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
          top: 185,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height - 245,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                buildTitleRow("TASKS"),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildTaskItem(3, "Designing", Colors.white),
                      buildTaskItem(3, "Mathematics 2", Colors.white),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

Container buildTaskItem(int numDays, String courseTitle, Color color) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.all(12),
    height: 140,
    width: 140,
    decoration: BoxDecoration(
      color: color.withOpacity(1),
      border:
          Border.all(color: Colors.black, width: 5.0, style: BorderStyle.solid),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 100,
          child: Text(
            courseTitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Row buildTitleRow(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      Text(
        "More",
        style: TextStyle(
            fontSize: 12,
            color: Color(0XFF3E3993),
            fontWeight: FontWeight.bold),
      )
    ],
  );
}
