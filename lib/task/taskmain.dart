import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:student_app/homepage.dart';
import 'package:group_student_app_1/task/taskhomepage.dart';
// import 'package:student_app/TaskPage.dart';
import 'package:group_student_app_1/task/Taskpage.dart';
// import 'package:student_app/TaskInput.dart';
import 'package:group_student_app_1/task/taskinput.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "XXX", // Your apiKey
      appId: "XXX", // Your appId
      messagingSenderId: "XXX", // Your messagingSenderId
      projectId: "XXX", // Your projectId
    ),
  );

  runApp(StudentApp());
}

class StudentApp extends StatefulWidget {
  @override
  _StudentAppState createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
  int _selectedItemIndex = 0;
  final List pages = [
    TaskHomepage(),
    null,
    TaskPage(),
    null,
    null,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: Colors.black,
            selectedItemColor: Color.fromARGB(255, 132, 50, 255),
            selectedIconTheme:
                IconThemeData(color: Color.fromARGB(255, 132, 50, 255)),
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Notes',
                icon: Icon(Icons.menu_book),
              ),
              BottomNavigationBarItem(
                label: 'Tasks',
                icon: Icon(Icons.check_circle),
              ),
              BottomNavigationBarItem(
                label: 'Calendar',
                icon: Icon(Icons.calendar_today),
              ),
              BottomNavigationBarItem(
                label: 'Chat',
                icon: Icon(Icons.forum),
              ),
            ],
          ),
          body: pages[_selectedItemIndex]),
    );
  }
}
